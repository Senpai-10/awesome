local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local get_script = require("lua.helpers").get_script
local markup_clr = require("lua.helpers").markup_clr

local M = {}

M.widget = {
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
	-- bg = beautiful.widget_bg,
	shape = gears.shape.rectangle,
	widget = wibox.container.background,
}

return M
