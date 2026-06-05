{username, ...}: {
  system.stateVersion = 4;

  system.primaryUser = username;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  ids.gids.nixbld = 350;
  security.pam.services.sudo_local.touchIdAuth = true;

  # homebrew = {
  #   enable = true;
  #   onActivation = {
  #     autoUpdate = true;
  #     cleanup = "zap";
  #     upgrade = true;
  #   };
  # };

  # system.defaults = {
  #   dock.autohide = true;
  #   finder.AppleShowAllFiles = true;
  # };
}
