{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (callPackage ./asciiss.nix {})
  ];
}
