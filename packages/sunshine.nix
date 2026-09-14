{ pkgs, ... }: {
  services.sunshine = {
    enable = true;
    autoStart = true;
    openFirewall = true;

    # Универсальный захват Wayland через DRM/KMS.
    capSysAdmin = true;

    settings.csrf_allowed_origins =
      "https://nixos:47990,https://nixos.local:47990,https://192.168.0.2:47990,https://ru.cupscloud.ru:4799";
  };
}
