{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    blender

    qimgv
    darktable
  ];
}
