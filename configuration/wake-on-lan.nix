{ pkgs, ... }:

let
  enableWakeOnLan = pkgs.writeShellScript "enable-wake-on-lan" ''
    for interfacePath in /sys/class/net/*; do
      interfaceName="''${interfacePath##*/}"

      # Only physical wired adapters have a device entry and no wireless entry.
      if [ ! -e "$interfacePath/device" ] || [ -e "$interfacePath/wireless" ]; then
        continue
      fi

      # Keep the adapter powered while the machine is running.
      powerControl="$interfacePath/device/power/control"
      if [ -w "$powerControl" ]; then
        echo on > "$powerControl"
      fi

      wakeupControl="$interfacePath/device/power/wakeup"
      if [ -w "$wakeupControl" ]; then
        echo enabled > "$wakeupControl"
      fi

      # Enable waking by magic packet when the adapter supports it.
      if ${pkgs.ethtool}/bin/ethtool "$interfaceName" 2>/dev/null \
        | ${pkgs.gnugrep}/bin/grep -q 'Supports Wake-on:.*g'; then
        if ${pkgs.ethtool}/bin/ethtool --change "$interfaceName" wol g; then
          echo "Wake-on-LAN enabled for $interfaceName"
        else
          echo "Failed to enable Wake-on-LAN for $interfaceName" >&2
        fi
      fi
    done

    exit 0
  '';
in
{
  # Magic packet (0x40). NetworkManager applies this default to wired profiles.
  networking.networkmanager.settings.connection."ethernet.wake-on-lan" = 64;

  environment.systemPackages = [ pkgs.ethtool ];

  systemd.services.wake-on-lan = {
    description = "Keep wired adapters powered and enable Wake-on-LAN";
    wantedBy = [ "multi-user.target" ];

    # Starting before and stopping after NetworkManager prevents it from being
    # the last component to change the adapter's Wake-on-LAN state.
    before = [ "NetworkManager.service" ];

    script = "${enableWakeOnLan}";
    preStop = "${enableWakeOnLan}";

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };

  systemd.services.wake-on-lan-before-sleep = {
    description = "Enable Wake-on-LAN before sleep";
    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ];
    script = "${enableWakeOnLan}";
    serviceConfig.Type = "oneshot";
  };
}
