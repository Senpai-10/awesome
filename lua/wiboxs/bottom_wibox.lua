local awful = require("awful")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
-- local beautiful = require("beautiful")
-- local mymainmenu = require("lua.menus")
-- local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

local scripts_dir = gfs.get_xdg_config_home() .. "awesome/scripts/"

local function get_script(name)
	return scripts_dir .. name
end

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock("%A %F %l:%M:%S %P ", 1)

-- local separator = wibox.widget.textbox(" ⏽ ")
local separator = wibox.widget.textbox("  ")

local M = {}

function M.setup(screen)
	-- Create the wibox
	screen.bottom_wibox = awful.wibar({ position = "bottom", screen = screen, height = 28 })

	-- Add widgets to the wibox
	screen.bottom_wibox:setup({
		layout = wibox.layout.align.horizontal,
		-- { -- Left widgets
		-- 	layout = wibox.layout.fixed.horizontal,
		-- 	mylauncher,
		-- },
		nil,
		-- s.mytasklist, -- Middle widget
		nil,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			awful.widget.watch("bash -c " .. get_script("network.sh"), 1),
			separator,
			awful.widget.watch("bash -c " .. get_script("updates.sh"), 1800),
			separator,
			mykeyboardlayout,
			separator,
			awful.widget.watch("bash -c " .. get_script("weather.sh"), 120),
			separator,
			awful.widget.watch("bash -c " .. get_script("uptime.sh"), 15),
			separator,
			awful.widget.watch("bash -c " .. get_script("cpu-usage.sh"), 3),
			separator,
			awful.widget.watch("bash -c " .. get_script("cpu-temp.sh"), 3),
			separator,
			awful.widget.watch("bash -c " .. get_script("ram-usage.sh"), 3),
			separator,
			mytextclock,
			wibox.widget.systray(),
			screen.mylayoutbox,
		},
		nil,
	})
end

return M
