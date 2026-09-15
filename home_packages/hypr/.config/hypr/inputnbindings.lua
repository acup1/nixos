-------------
--- INPUT ---
-------------

hl.config({
  input = {
    kb_layout = "us,ru",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:win_space_toggle",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0.5,
    touchpad = {
      natural_scroll = false,
      clickfinger_behavior = true,
      disable_while_typing = false,
    },
  },
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

----------------
--- GESTURES ---
----------------

-- DMS 0.55+ generates Lua bindings. Keep them optional so the first Hyprland
-- start still succeeds before `dms setup` has created the fragments.
local dmsBindsLoaded = pcall(require, "dms.binds")
pcall(require, "dms.binds-user")

if not dmsBindsLoaded then
  hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
end

hl.gesture({
  fingers = 3,
  direction = "up",
  action = function()
    hl.dispatch(hl.dsp.global("caelestia:launcher"))
    hl.exec_cmd("pkill -34 wvkbd-mobintl")
  end,
})

hl.gesture({
  fingers = 3,
  direction = "down",
  action = function()
    hl.exec_cmd("caelestia shell picker openFreeze")
  end,
})

hl.gesture({ fingers = 4, direction = "down", action = "close" })

-------------------
--- KEYBINDINGS ---
-------------------

local mainMod = "SUPER"
local terminal = "ghostty"
local browser = "zen-browser"
local fileManager = terminal .. " -e yazi"
local processManager = terminal .. " -e btop"
local statusBar = "waybar"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("neovide"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(fileManager .. " ~/.config/"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(processManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(statusBar .. " || pkill " .. statusBar))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill " .. statusBar))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + A", hl.dsp.window.pin())
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("caelestia shell picker openFreezeClip"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grimblast copy active"))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("systemctl sleep"), { locked = true })

-- Move focus with mainMod + arrow keys.
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind("ALT + Tab", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Switch workspaces and move the active window with mainMod + [0-9].
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspaces (scratchpads).
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special("telegram"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:telegram" }))

-- Scroll through existing workspaces.
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Move and resize windows.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
hl.bind("SUPER + CTRL + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ x = 200, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ x = -200, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ x = 0, y = -200, relative = true }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ x = 0, y = 200, relative = true }))

-- Laptop multimedia keys.
local repeatLocked = { repeating = true, locked = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"), repeatLocked)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"), repeatLocked)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), repeatLocked)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), repeatLocked)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), repeatLocked)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), repeatLocked)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("hyprlock & systemctl suspend"))

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"), { locked = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"), { locked = true })

-- Launcher and DMS global-shortcut interruption.
hl.bind(mainMod .. " + X", hl.dsp.global("caelestia:launcher"))
local interruptLauncher = { ignore_mods = true, non_consuming = true }
for _, button in ipairs({ "mouse:272", "mouse:273", "mouse:274", "mouse:275", "mouse:276", "mouse:277", "mouse_up", "mouse_down" }) do
  hl.bind(mainMod .. " + " .. button, hl.dsp.global("caelestia:launcherInterrupt"), interruptLauncher)
end
