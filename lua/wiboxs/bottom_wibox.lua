local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
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
-- local separator = wibox.widget.textbox("  ")
local separator = wibox.widget.textbox(" ")

local M = {}

function M.setup(screen)
    -- to get the same light colors
    -- set HSV's last % to 91

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
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("network.sh"), 1),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#8ee861",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("updates.sh"), 1800),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#e8ab61",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = mykeyboardlayout,
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#61e8c2",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("weather.sh"), 120),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#e861a0",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("uptime.sh"), 15),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#748be8",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("cpu-usage.sh"), 3),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#7dbde8",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("cpu-temp.sh"), 3),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#7dbde8",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("ram-usage.sh"), 3),
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#7dbde8",
				widget = wibox.container.background,
			},
			separator,
			{
				{
					{
						widget = mytextclock,
					},
					left = 10,
					right = 10,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = "#e86161",
				widget = wibox.container.background,
			},
			wibox.widget.systray(),
			screen.mylayoutbox,
		},
		nil,
	})
end

return M
