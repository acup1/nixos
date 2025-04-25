{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cava
  ];
  xdg.configFile."cava/config".source = ../.config/cava/config;
}
