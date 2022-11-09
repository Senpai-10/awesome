local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local mytextclock = wibox.widget.textclock("%A %F %l:%M:%S %P ", 1)

local M = {}

M.widget = {
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
    bg = beautiful.widget_bg,
    shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
}

return M
