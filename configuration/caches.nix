{ ... }: {

  nix.settings.substituters = [
    "https://cache.nixos.org"

    "https://nix-community.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://devenv.cachix.org"
    "https://hyprland.cachix.org"
  ];

  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUD8RtTaDL9aNMvl/fZYmo="
    "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  ];

  nix.settings.trusted-substituters = [
    "https://nix-community.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://hyprland.cachix.org"
  ];
}
