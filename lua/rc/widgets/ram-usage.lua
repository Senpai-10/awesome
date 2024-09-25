local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers").get_script
local gears = require("gears")

local M = {}

local widget = awful.widget.watch("bash -c " .. get_script("ram-usage.sh"), 1)

awful.tooltip({
	objects = { widget },
	timer_function = function()
		local output = assert(io.popen("free -th")):read("*a")

		return output
	end,
})

M.widget = {
	{
		{
			widget = widget,
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
