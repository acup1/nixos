-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
  hl.exec_cmd("bluetoothctl power off")
  hl.exec_cmd("dms run")
  hl.exec_cmd("iio-hyprland")
end)
