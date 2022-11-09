local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")

local M = {}

M.widget = {
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
    bg = beautiful.widget_bg,
    shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
}

return M
