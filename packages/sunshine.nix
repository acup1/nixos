{
  inputs,
  pkgs,
  username,
  ...
}: let
  hostSystem = pkgs.stdenv.hostPlatform.system;
  hyprland = inputs.hyprland.packages.${hostSystem}.hyprland;

  sunshineClientMode = pkgs.writeShellScript "sunshine-client-mode" ''
    set -eu

    stream_width="''${SUNSHINE_CLIENT_WIDTH:-1920}"
    stream_height="''${SUNSHINE_CLIENT_HEIGHT:-1080}"
    stream_fps="''${SUNSHINE_CLIENT_FPS:-60}"

    ${hyprland}/bin/hyprctl keyword monitor \
      "SUNSHINE,''${stream_width}x''${stream_height}@''${stream_fps},0x0,1"
  '';

  sunshineDefaultMode = pkgs.writeShellScript "sunshine-default-mode" ''
    set -eu

    ${hyprland}/bin/hyprctl keyword monitor \
      'SUNSHINE,1920x1080@60,0x0,1'
  '';

  sunshineHeadless = pkgs.writeShellScript "sunshine-headless" ''
    set -eu

    ready=0
    for attempt in $(${pkgs.coreutils}/bin/seq 1 50); do
      if ${hyprland}/bin/hyprctl monitors all >/dev/null 2>&1; then
        ready=1
        break
      fi
      ${pkgs.coreutils}/bin/sleep 0.2
    done

    if [ "$ready" -ne 1 ]; then
      echo "Hyprland IPC is not ready" >&2
      exit 1
    fi

    if ! ${hyprland}/bin/hyprctl monitors all \
      | ${pkgs.gnugrep}/bin/grep -q '^Monitor SUNSHINE '; then
      ${hyprland}/bin/hyprctl output create headless SUNSHINE
    fi

    ${sunshineDefaultMode}

    if ${hyprland}/bin/hyprctl monitors all \
      | ${pkgs.gnugrep}/bin/grep -q '^Monitor HEADLESS-0 '; then
      ${hyprland}/bin/hyprctl output remove HEADLESS-0
    fi
  '';
in {
  # Для полностью headless-загрузки GDM сразу запускает пользовательскую
  # сессию Hyprland, в которой создаётся виртуальный монитор SUNSHINE.
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = username;
    };
    defaultSession = "hyprland";
  };

  services.sunshine = {
    enable = true;
    autoStart = true;
    openFirewall = true;

    # KMS не может захватить отключённый физический дисплей. WLR получает
    # изображение виртуального выхода напрямую от Hyprland.
    capSysAdmin = false;

    settings = {
      capture = "wlr";
      output_name = "SUNSHINE";
      global_prep_cmd = builtins.toJSON [
        {
          do = "${sunshineClientMode}";
          undo = "${sunshineDefaultMode}";
        }
      ];
      csrf_allowed_origins =
        "https://nixos:47990,https://nixos.local:47990,https://192.168.0.2:47990,https://ru.cupscloud.ru:4799,https://ru.cupscloud.ru:47990";
    };
  };

  systemd.user.services = {
    sunshine-headless = {
      description = "Create a virtual Hyprland output for Sunshine";
      before = ["sunshine.service"];
      partOf = ["graphical-session.target"];
      unitConfig.ConditionUser = username;
      serviceConfig = {
        Type = "oneshot";
        ExecStart = sunshineHeadless;
        RemainAfterExit = true;
      };
    };

    sunshine = {
      # Не запускать Sunshine в пользовательской сессии самого GDM.
      unitConfig.ConditionUser = username;
      requires = ["sunshine-headless.service"];
      after = ["sunshine-headless.service"];
    };
  };
}
