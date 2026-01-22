{ pkgs, services, config, inputs, ... }: {
  # imports = [ inputs.nix-serve-ng.nixosModules.default ];
  # imports = [ inputs.nix-serve-ng.nixosModules.default ];
  #
  # services.nix-serve.enable = true;

  # services.nix-serve.package = pkgs.nix-serve-ng;
  services.nix-serve = {
    enable = true;
    bindAddress = "0.0.0.0";
    port = 5000;
    openFirewall = true;
    secretKeyFile = "/var/cache-priv-key.pem";
  };
  # networking.firewall.allowedTCPPorts = [ 5000 ];

  nix.settings.substituters = [
    "https://cache.nixos.org"
    "https://192.168.0.211:5000"

    "https://nix-community.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://devenv.cachix.org"
    "https://hyprland.cachix.org"
  ];

  nix.settings.trusted-public-keys = [
    "192.168.0.211:WvTxomUKz1NdvgMx2QTiE5hZF5Zd2lKV/HDPHx33iuI="
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUD8RtTaDL9aNMvl/fZYmo="
    "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  ];

  nix.settings.trusted-substituters = [
    "https://192.168.0.211:5000"
    "https://nix-community.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://hyprland.cachix.org"
  ];
}
