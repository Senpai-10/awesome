local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local M = {}

local watch_widget = wibox.widget.textbox("神  uptime")

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

local uptime_tooltip = awful.tooltip({})

uptime_tooltip:add_to_object(watch_widget)

watch_widget:connect_signal("mouse::enter", function()
	local handle = assert(io.popen("uptime -p"))
	local result = handle:read("*a")

	uptime_tooltip.text = result

	handle:close()
end)

return M
