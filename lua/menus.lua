local awful = require("awful")

local apps_menu = require("lua.submenus.apps_menu")
local power_menu = require("lua.submenus.power_menu")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

return awful.menu({
	items = {
		{ "Applications", apps_menu },
		{
			"Hotkeys",
			function()
				hotkeys_popup.show_help(nil, awful.screen.focused())
			end,
		},
		{ "Open terminal", TERMINAL },
		{ "Manage todos", EDITOR_CMD .. " /home/senpai/.todo" },
        {
            "Run backup script",
            function()
                awful.spawn.with_shell(TERMINAL .. " -e " .. "~/.dotfiles/backup.py")
            end
        },
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
