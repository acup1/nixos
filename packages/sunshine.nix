{ pkgs, ... }: {
  services.sunshine = {
    enable = true;
    autoStart = true;
    openFirewall = true;

    # Универсальный захват Wayland через DRM/KMS.
    capSysAdmin = true;
  };
}
