{ username, ... }: {
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
      csrf_allowed_origins =
        "https://nixos:47990,https://nixos.local:47990,https://192.168.0.2:47990,https://ru.cupscloud.ru:4799";
    };
  };

  # Не запускать Sunshine в пользовательской сессии самого GDM.
  systemd.user.services.sunshine.unitConfig.ConditionUser = username;
}
