{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # telegram-desktop
    # discord
    # rocketchat-desktop
    # discord-canary
  ];
}
