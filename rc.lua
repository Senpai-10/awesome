-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local treetile = require("treetile")
local cyclefocus = require("cyclefocus")
treetile.focusnew = true
cyclefocus.display_notifications = false

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/main/theme.lua")

-- This is used later as the default terminal and editor to run.
TERMINAL = os.getenv("TERMINAL") or "alacritty"
EDITOR = os.getenv("EDITOR") or "vim"
FILES_MANAGER = os.getenv("FILEMANAGER")
MUSIC_PLAYER = "cmus"

EDITOR_CMD = TERMINAL .. " -e " .. EDITOR

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
MODKEY = "Mod4"

-- TAG_ICON = "  "
TAG_ICON = "  "
-- TAG_ICON = "  "
-- TAG_ICON_SELECTED = "  "

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	treetile,
	awful.layout.suit.floating,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}

local mymainmenu = require("lua.menus")

-- Menubar configuration
menubar.utils.terminal = TERMINAL -- Set the terminal for applications that require it
-- }}}

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(require("lua.setup_screen").setup)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
local globalkeys = require("lua.key_bindings")
-- }}}

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = require("lua.client_rules")
-- }}}

require("lua.signals")

-- Autostart Apps
awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "autorun.sh")
-- awful.spawn.with_shell("~/.config/awesome/autorun.sh")
