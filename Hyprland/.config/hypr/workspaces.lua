--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({ match = { class = "^(foot)$" }, opacity = "0.9 0.9" })

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2", layout = "scrolling" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-3", layout = "scrolling" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-3", default_name = "Browser" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-3", default_name = "Messages" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-3", default_name = "Music" })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-2", layout = "master", default_name = "Games" })

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({ workspace = 3, match = { class = "^(librewolf)$" } })

hl.window_rule({ workspace = 4, match = { class = "^(org.telegram.desktop)$" }, })
hl.window_rule({ workspace = 4, match = { class = "^(whatsdesk)$" }, })
hl.window_rule({ workspace = 4, match = { class = "^(discord)$", }, })
hl.window_rule({ workspace = 4, match = { class = "^(Prospect Mail)$", }, })

hl.window_rule({ workspace = 5, match = { class = "^(Spotify)$", }, })
hl.window_rule({ workspace = 5, match = { class = "^(feishin)$", }, })

hl.window_rule({ workspace = 6, match = { class = "^(steam)$", }, })
hl.window_rule({ workspace = 6, match = { class = "^(Upload Labs)$", }, })
