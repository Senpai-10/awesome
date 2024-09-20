local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local M = {}

local watch_widget = wibox.widget.textbox("󱑀  uptime")

awful.tooltip({
	objects = { watch_widget },
	timer_function = function()
		local uptime = assert(io.popen("uptime -p")):read("*a")
		local uptime_since = assert(io.popen("uptime -s")):read("*a")

		return uptime .. "\n" .. "Since: " .. uptime_since
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
	-- bg = beautiful.widget_bg,
	shape = gears.shape.rectangle,
	widget = wibox.container.background,
}

return M
