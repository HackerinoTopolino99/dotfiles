---------------------
---- KEYBINDINGS ----
---------------------

local programs = require("programs")

-- See https://wiki.hyprland.org/Configuring/Keywords/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind("CONTROL + ALT + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" $HOME/Immagini/Schermate/Schermata_$(date +%Y%m%d_%H%M%S).png && notify-send "Immagine salvata in $HOME/Immagini/Schermate/Schermata_$(date+%Y%m%d_%H%M%S).png"'))
hl.bind(mainMod .. "+ Print", hl.dsp.exec_cmd([[hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - ~/Immagini/Schermate/Schermata_$(date +%Y%m%d_%H%M%S).png && notify-send "Immagine salvata in $HOME/Immagini/Schermate/Schermata_$(date +%Y%m%d_%H%M%S).png"]]))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({action = "toggle" }))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E ", hl.dsp.exec_cmd(programs.fileManager))
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- DMS
-- Application Launchers
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mainMod .. " + ALT + T", hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))

-- Security
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("playerctl play-pause && dms ipc call lock lock"))

-- Audio Controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 5"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 5"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })

-- Brightness Controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("dms ipc call spotlight toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call spotlight toggle"), { locked = true, repeating = true })
