local awful = require("awful")

local apps_menu = require("lua.submenus.apps_menu")
local power_menu = require("lua.submenus.power_menu")

return awful.menu({
	items = {
		{ "Applications", apps_menu },
		{
			"Hotkeys",
			function()
				hotkeys_popup.show_help(nil, awful.screen.focused())
			end,
		},
		{ "Open terminal", terminal },
		{ "Manage todos", editor_cmd .. " /home/senpai/.todo" },
		{
			"Restart imwheel",
			function()
				awful.spawn.with_shell("killall imwheel && imwheel -b 45")
			end,
		},
		{ "Restart awesome", awesome.restart },
		{ "Power menu", power_menu },
		{
			"Lock Xserver",
			function()
				awful.spawn("xtrlock")
			end,
		},
		{ "Close", "" },
	},
	theme = { width = 400, height = 23 },
})
