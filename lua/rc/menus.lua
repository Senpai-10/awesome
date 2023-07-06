local awful = require("awful")
local default = require("lua.rc.default")

local apps_menu = require("lua.rc.submenus.apps_menu")
local power_menu = require("lua.rc.submenus.power_menu")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

local open_files_menu = {
	{ "Open todos", default.editor_cmd .. " /home/senpai/.todo" },
	{
		"Open awesome config",
		function()
			awful.spawn.with_shell(default.editor_cmd .. " ~/.config/awesome/")
		end,
	},
	{
		"Open neovim config",
		function()
			awful.spawn.with_shell(default.editor_cmd .. " ~/.config/nvim/")
		end,
	},
}

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
		{ "Open in editor", open_files_menu },
		{
			"Run backup script",
			function()
				awful.spawn.with_shell(default.terminal .. " -e " .. "~/.dotfiles/backup.py")
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
