{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    virt-manager
    qemu
  ];
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
}
