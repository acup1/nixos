{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_zen.cpupower
    bat
    neovim
  ];
}
