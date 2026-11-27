---@module 'hl'

-- See https://wiki.hypr.land/Configuring/Keywords/

local modifier = "ALT"
local programs = require("modules.programs")

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more

hl.bind(modifier .. " + " .. "Return", hl.dsp.exec_cmd(programs.terminal .. " --hold fastfetch"))
hl.bind(modifier .. " + " .. "Q", hl.dsp.window.close())
hl.bind(modifier .. " + " .. "E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(modifier .. " + " .. "F", hl.dsp.window.float())
hl.bind(modifier .. " + " .. "Space", hl.dsp.exec_cmd(programs.menu))
hl.bind(modifier .. " + " .. "P", hl.dsp.window.pseudo())

-- dwindle
hl.bind(modifier .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(modifier .. " + " .. "B", hl.dsp.exec_cmd(programs.webBrowser))
hl.bind(modifier .. " + " .. "L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(modifier .. " + " .. "S", hl.dsp.exec_cmd("flatpak run com.spotify.Client"))
hl.bind(
	modifier .. " + " .. "V",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy")
)
hl.bind(modifier .. " + " .. "period", hl.dsp.exec_cmd("rofimoji --action copy --skin-tone light"))
hl.bind(modifier .. " + " .. "K", hl.dsp.exec_cmd("~/dotfiles/.config/rofi/wallpaper-picker/wallpaper-picker.sh"))
hl.bind(modifier .. " + " .. "O", hl.dsp.exec_cmd("lua ~/scripts/sound_picker.lua"))
hl.bind(modifier .. " + " .. "M", hl.dsp.exec_cmd("killall noctalia && noctalia"))
hl.bind(modifier .. " + " .. "N", hl.dsp.exec_cmd("~/scripts/notes.sh"))

-- Move focus with mainMod + arrow keys
hl.bind(modifier .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(modifier .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("CTRL" .. " + " .. modifier .. " + " .. "left", hl.dsp.window.move({ direction = "left" }))
hl.bind("CTRL" .. " + " .. modifier .. " + " .. "right", hl.dsp.window.move({ direction = "right" }))
hl.bind("CTRL" .. " + " .. modifier .. " + " .. "down", hl.dsp.window.swap({ direction = "down" }))
hl.bind("CTRL" .. " + " .. modifier .. " + " .. "up", hl.dsp.window.swap({ direction = "up" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(modifier .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(modifier .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(modifier .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(modifier .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(modifier .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(modifier .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(modifier .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(modifier .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(modifier .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(modifier .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. "right", hl.dsp.window.move({ direction = "right" }))
hl.bind(modifier .. " + " .. "SHIFT" .. " + " .. "left", hl.dsp.window.move({ direction = "left" }))

-- Move workspaces to monitors
hl.bind("CTRL" .. " + " .. modifier .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.workspace.move({ monitor = 0 }))
hl.bind("CTRL" .. " + " .. modifier .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.workspace.move({ monitor = 1 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(modifier .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(modifier .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(modifier .. " + " .. "SUPER" .. " + " .. "right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(modifier .. " + " .. "SUPER" .. " + " .. "left", hl.dsp.focus({ workspace = "e-1" }))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots --freeze"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("~/scripts/interactive_screenshot.sh"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(modifier .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(modifier .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = true, locked = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true, locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
