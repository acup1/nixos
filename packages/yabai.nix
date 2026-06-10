{
  config,
  pkgs,
  lib,
  ...
}: {
  # services.yabai = {
  #   enable = true;
  #
  #   config = {
  #     layout = "bsp";
  #
  #     top_padding = 6;
  #     bottom_padding = 6;
  #     left_padding = 6;
  #     right_padding = 6;
  #     window_gap = 6;
  #
  #     focus_follows_mouse = "autofocus";
  #     mouse_follows_focus = "on";
  #
  #     mouse_modifier = "fn";
  #     mouse_action1 = "move";
  #     mouse_action2 = "resize";
  #     mouse_drop_action = "swap";
  #
  #     window_placement = "second_child";
  #     split_ratio = "0.5";
  #     auto_balance = "off";
  #
  #     window_border = "on";
  #     window_border_width = 2;
  #     active_window_border_color = "0xffa4e4bf";
  #     normal_window_border_color = "0xff505050";
  #     insert_feedback_color = "0xff9b0000";
  #
  #     window_shadow = "on";
  #     window_opacity = "off";
  #   };
  #
  #   extraConfig = ''
  #     yabai -m rule --add app="^System Preferences$"  manage=off
  #     yabai -m rule --add app="^System Information$"  manage=off
  #     yabai -m rule --add app="^Activity Monitor$"    manage=off
  #     yabai -m rule --add app="^Calculator$"          manage=off
  #     yabai -m rule --add app="^Finder$"              manage=off
  #     yabai -m rule --add app="^Archive Utility$"     manage=off
  #     yabai -m rule --add title="^Picture in Picture$" manage=off
  #
  #     echo "yabai config loaded"
  #   '';
  # };
  #
  # services.skhd = {
  #   enable = true;
  #
  #   skhdConfig = ''
  #     # =============================================================
  #     # НАВИГАЦИЯ (Mod+H/J/K/L и стрелки)
  #     # =============================================================
  #
  #     alt - h     : yabai -m window --focus west
  #     alt - j     : yabai -m window --focus south
  #     alt - k     : yabai -m window --focus north
  #     alt - l     : yabai -m window --focus east
  #     alt - left  : yabai -m window --focus west
  #     alt - down  : yabai -m window --focus south
  #     alt - up    : yabai -m window --focus north
  #     alt - right : yabai -m window --focus east
  #
  #     alt - home : yabai -m window --focus first
  #     alt - end  : yabai -m window --focus last
  #
  #     # =============================================================
  #     # ПЕРЕМЕЩЕНИЕ ОКОН (Mod+Ctrl+H/J/K/L)
  #     # =============================================================
  #
  #     alt + ctrl - h     : yabai -m window --warp west
  #     alt + ctrl - j     : yabai -m window --warp south
  #     alt + ctrl - k     : yabai -m window --warp north
  #     alt + ctrl - l     : yabai -m window --warp east
  #     alt + ctrl - left  : yabai -m window --warp west
  #     alt + ctrl - down  : yabai -m window --warp south
  #     alt + ctrl - up    : yabai -m window --warp north
  #     alt + ctrl - right : yabai -m window --warp east
  #
  #     alt + ctrl - home : yabai -m window --swap first
  #     alt + ctrl - end  : yabai -m window --swap last
  #
  #     # =============================================================
  #     # МОНИТОРЫ (Mod+Shift+H/J/K/L)
  #     # =============================================================
  #
  #     alt + shift - h     : yabai -m display --focus west
  #     alt + shift - j     : yabai -m display --focus south
  #     alt + shift - k     : yabai -m display --focus north
  #     alt + shift - l     : yabai -m display --focus east
  #     alt + shift - left  : yabai -m display --focus west
  #     alt + shift - down  : yabai -m display --focus south
  #     alt + shift - up    : yabai -m display --focus north
  #     alt + shift - right : yabai -m display --focus east
  #
  #     # Переместить окно на монитор (Mod+Shift+Ctrl)
  #     alt + shift + ctrl - h     : yabai -m window --display west;  yabai -m display --focus west
  #     alt + shift + ctrl - j     : yabai -m window --display south; yabai -m display --focus south
  #     alt + shift + ctrl - k     : yabai -m window --display north; yabai -m display --focus north
  #     alt + shift + ctrl - l     : yabai -m window --display east;  yabai -m display --focus east
  #     alt + shift + ctrl - left  : yabai -m window --display west;  yabai -m display --focus west
  #     alt + shift + ctrl - down  : yabai -m window --display south; yabai -m display --focus south
  #     alt + shift + ctrl - up    : yabai -m window --display north; yabai -m display --focus north
  #     alt + shift + ctrl - right : yabai -m window --display east;  yabai -m display --focus east
  #
  #     # =============================================================
  #     # ВОРКСПЕЙСЫ (Mod+1-9)
  #     # =============================================================
  #
  #     alt - 1 : yabai -m space --focus 1
  #     alt - 2 : yabai -m space --focus 2
  #     alt - 3 : yabai -m space --focus 3
  #     alt - 4 : yabai -m space --focus 4
  #     alt - 5 : yabai -m space --focus 5
  #     alt - 6 : yabai -m space --focus 6
  #     alt - 7 : yabai -m space --focus 7
  #     alt - 8 : yabai -m space --focus 8
  #     alt - 9 : yabai -m space --focus 9
  #
  #     # focus-workspace-down/up (Mod+U/I)
  #     alt - u         : yabai -m space --focus next
  #     alt - i         : yabai -m space --focus prev
  #     alt - page_down : yabai -m space --focus next
  #     alt - page_up   : yabai -m space --focus prev
  #
  #     # Переместить окно на воркспейс (Mod+Shift+1-9)
  #     alt + shift - 1 : yabai -m window --space 1
  #     alt + shift - 2 : yabai -m window --space 2
  #     alt + shift - 3 : yabai -m window --space 3
  #     alt + shift - 4 : yabai -m window --space 4
  #     alt + shift - 5 : yabai -m window --space 5
  #     alt + shift - 6 : yabai -m window --space 6
  #     alt + shift - 7 : yabai -m window --space 7
  #     alt + shift - 8 : yabai -m window --space 8
  #     alt + shift - 9 : yabai -m window --space 9
  #
  #     # Переместить окно на воркспейс вниз/вверх (Mod+Ctrl+U/I)
  #     alt + ctrl - u : yabai -m window --space next; yabai -m space --focus next
  #     alt + ctrl - i : yabai -m window --space prev; yabai -m space --focus prev
  #
  #     # =============================================================
  #     # РАЗМЕР ОКОН
  #     # =============================================================
  #
  #     # set-column-width -10% / +10% (Mod+Minus / Mod+Equal)
  #     alt - 0x1B : yabai -m window --resize right:-60:0
  #     alt - 0x18 : yabai -m window --resize right:60:0
  #
  #     # set-window-height -10% / +10% (Mod+Shift+Minus / Mod+Shift+Equal)
  #     alt + shift - 0x1B : yabai -m window --resize bottom:0:-60
  #     alt + shift - 0x18 : yabai -m window --resize bottom:0:60
  #
  #     # reset-window-height / balance (Mod+Ctrl+R)
  #     alt + ctrl - r : yabai -m space --balance
  #
  #     # switch-preset-column-width (Mod+R)
  #     alt - r : yabai -m window --ratio abs:0.5
  #
  #     # =============================================================
  #     # FULLSCREEN / MAXIMIZE
  #     # =============================================================
  #
  #     # maximize-column (Mod+F)
  #     alt - f : yabai -m window --toggle zoom-parent
  #
  #     # fullscreen-window (Mod+Shift+F)
  #     alt + shift - f : yabai -m window --toggle zoom-fullscreen
  #
  #     # =============================================================
  #     # FLOATING (Mod+V)
  #     # =============================================================
  #
  #     alt - v : yabai -m window --toggle float
  #
  #     # =============================================================
  #     # ЗАКРЫТЬ ОКНО (Mod+C)
  #     # =============================================================
  #
  #     alt - c : yabai -m window --close
  #
  #     # =============================================================
  #     # ПРИЛОЖЕНИЯ
  #     # =============================================================
  #
  #     # Mod+Q → ghostty
  #     alt - q : open -a Ghostty
  #
  #     # Mod+X → App Launcher
  #     alt - x : dms ipc call spotlight toggle
  #
  #     # Mod+Shift+E → Power Menu
  #     alt + shift - e : dms ipc call powermenu toggle
  #
  #     # =============================================================
  #     # МЕДИА
  #     # =============================================================
  #
  #     alt + shift - p : playerctl play-pause
  #     alt + shift - i : playerctl previous
  #     alt + shift - o : playerctl next
  #     alt + shift - k : wpctl set-volume @DEFAULT_SINK@ 5%-
  #     alt + shift - l : wpctl set-volume @DEFAULT_SINK@ 5%+
  #
  #     # =============================================================
  #     # СКРИНШОТЫ
  #     # =============================================================
  #
  #     0x69             : dms ipc call niri screenshotScreen
  #     shift - 0x69     : dms ipc call niri screenshot
  #     alt - 0x69       : dms ipc call niri screenshotWindow
  #   '';
  # };
}
