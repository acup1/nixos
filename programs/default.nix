{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (callPackage ./asciiss {})
    # (callPackage ./pt {})
    # (callPackage ./wps { })
    kitty
  ];
}
