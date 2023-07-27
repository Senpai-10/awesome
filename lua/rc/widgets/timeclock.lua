local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")

-- local mytextclock = wibox.widget.textclock("%A %F %l:%M:%S %P ", 1)
local mytextclock = wibox.widget.textclock("%a %l:%M:%S %P ", 1)

awful.tooltip({
	objects = { mytextclock },
	timer_function = function()
		return os.date("Today is %A %B %d %Y\n--------\nThe time is %I:%M:%S %p")
	end,
})

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
	shape = gears.shape.rectangle,
	widget = wibox.container.background,
}

return M
