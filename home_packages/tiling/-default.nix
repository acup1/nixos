{pkgs, ...}: {
  home.packages = with pkgs; [yabai skhd jq];

  xdg.configFile."yabai/yabairc" = {
    executable = true;
    source = ./yabairc;
  };

  xdg.configFile."skhd/skhdrc".source = ./skhdrc;

  launchd.agents.yabai = {
    enable = true;
    config = {
      ProgramArguments = ["${pkgs.yabai}/bin/yabai"];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/yabai.out.log";
      StandardErrorPath = "/tmp/yabai.err.log";
    };
  };

  launchd.agents.skhd = {
    enable = true;
    config = {
      ProgramArguments = ["${pkgs.skhd}/bin/skhd"];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/skhd.out.log";
      StandardErrorPath = "/tmp/skhd.err.log";
    };
  };
}
