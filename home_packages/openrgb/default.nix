{ pkgs, config, inputs, ... }: {
  home.packages = with pkgs; [ openrgb ];
  #
  # systemd.user = {
  #   services.rk-udev = {
  #     Unit = {
  #       Description = "Add udev rules for RK keyboard";
  #       After = "default.target";
  #     };
  #     Service = {
  #       Type = "oneshot";
  #       ExecStart =
  #         "${pkgs.bash}/bin/bash -c 'echo SUBSYSTEMS==\\\"usb\\\", ATTRS{idVendor}==\\\"258a\\\", MODE=\\\"0660\\\", GROUP=\\\"users\\\" > /etc/udev/rules.d/99-rk-n99.rules'";
  #       ExecStartPost = "${pkgs.systemd}/bin/udevadm control --reload-rules";
  #       ExecStartPost = "${pkgs.systemd}/bin/udevadm trigger";
  #     };
  #     Install = { WantedBy = [ "default.target" ]; };
  #   };
  # };
}
