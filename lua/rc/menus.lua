local awful = require("awful")
local default = require("lua.rc.default")

local apps_menu = require("lua.rc.submenus.apps_menu")
local power_menu = require("lua.rc.submenus.power_menu")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

return awful.menu({
	items = {
		{ "Applications", apps_menu },
		{
			"Terminal",
			function()
				awful.spawn(default.terminal)
			end,
		},
		{
			"Hotkeys",
			function()
				hotkeys_popup.show_help(nil, awful.screen.focused())
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
