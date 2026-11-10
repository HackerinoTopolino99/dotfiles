-- Your keybinds. dms setup never overwrites this file.
-- Loaded after binds.lua: binding a stock key here replaces it, hl.unbind("SUPER + X") frees it.
-- Saving in the DMS keybind editor rewrites this file and keeps only hl.bind/hl.unbind lines.

hl.unbind("ALT + R")
hl.bind("ALT + R", hl.dsp.exec_cmd("dms ipc call spotlight-bar toggle"), { description = "dms ipc call spotlight-bar toggle" })
hl.unbind("SUPER + E")
hl.bind("SUPER + E", hl.dsp.exec_cmd("dms ipc call defaultApp fileManager"), { description = "Default File Manager: Open" })
hl.unbind("SUPER + I")
hl.bind("SUPER + I", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"), { description = "dms ipc call settings focusOrToggle" })
hl.unbind("SUPER + R")
hl.bind("SUPER + R", hl.dsp.exec_cmd("dms ipc call spotlight toggle"), { description = "dms ipc call spotlight toggle" })
hl.unbind("ALT + CTRL + T")
hl.bind("ALT + CTRL + T", hl.dsp.exec_cmd("foot"), { description = "foot" })
hl.unbind("ALT + space")
hl.unbind("SUPER + ALT + L")
hl.unbind("SUPER + Return")
hl.unbind("SUPER + T")
hl.unbind("SUPER + comma")
hl.unbind("SUPER + space")
hl.unbind("SUPER + L")
hl.bind("SUPER + L", hl.dsp.exec_cmd("dms ipc call lock lock"), { description = "dms ipc call lock lock" })
hl.unbind("SUPER + V")
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
