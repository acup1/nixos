{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    teams-for-linux
    telegram-desktop
    discord
  ];
}
