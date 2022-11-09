local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local M = {}

local watch_widget = wibox.widget.textbox("神  uptime")

awful.tooltip({
	objects = { watch_widget },
	timer_function = function()
		local handle = assert(io.popen("uptime -p"))
		local result = handle:read("*a")

		handle:close()

		return result
	end,
})

M.widget = {
	{
		{
			widget = watch_widget,
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
