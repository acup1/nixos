{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (callPackage ./asciiss { })
    # (callPackage ./wps { })
    (callPackage ./wps_1 { })
    kitty
  ];
}
