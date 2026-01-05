{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    #(blender.override { cudaSupport = true; })
    freecad-wayland
    linuxPackages.nvidia_x11
    libglvnd
    coin3d
    # qt5.full
    mesa-demos

    qimgv
    darktable
  ];
}
