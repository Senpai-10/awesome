local awful = require("awful")
local beautiful = require("beautiful")
local clientkeys = require("lua.rc.client_keys")

local clientbuttons = require("lua.rc.client_buttons")

return {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"feh",
				"nitrogen",
				"Eog",
				"Nsxiv",
				"gnome-calculator",
				"dotm-gui",
				"Yad",
				"Nitrogen",
				"Mytodo",
				"Manga-reader",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				"simplescreenrecorder",
			},
		},
		properties = { floating = true },
	},

	-- Center any floating window on the screen
	{
		rule_any = { floating = true },
		properties = {
			placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },

	--     { rule = { class = "discord" },
	--         properties = { screen = 1, tag = "9" }
	--     },

	--     { rule = { class = "spotify" },
	--         properties = { screen = 1= "8" }
	--     },

	{ rule = { class = "Steam" }, properties = { screen = 1, tag = "7" } },
	{ rule = { class = "mpv" }, properties = { floating = true, fullscreen = true } },
	{ rule = { name = "Anime org" }, properties = { floating = true } },
	{ rule = { class = "Lt" }, properties = { floating = true, raise = true } },
}
