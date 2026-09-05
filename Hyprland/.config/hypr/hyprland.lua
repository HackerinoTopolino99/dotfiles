-- This is an example Hyprland config file.
-- Refer to the wiki for more information.
-- https://wiki.hyprland.org/Configuring/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:
-- require("myColors")

----------------------------------
------ AUTOSTART ------
----------------------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()
  -- Nwg-panel
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("nwg-panel")

  -- Message services
  hl.exec_cmd("Telegram -startintray")
  hl.exec_cmd("elecwhat")

  -- Mail Services
  hl.exec_cmd("mailspring -b")
  hl.exec_cmd("prospect-mail")
end)
require("autostart")

require("environment")
require("input")
require("look")
require("permissions")
require("programs")
require("keybindings")
require("workspaces")
require("misc")
require("monitors")
