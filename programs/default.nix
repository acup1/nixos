{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (callPackage ./asciiss { })
    (callPackage ./wps { })
    kitty
  ];
}
