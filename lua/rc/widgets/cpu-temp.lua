local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")
local markup_clr = require("lua.helpers.markup_clr")

local M = {}

local cpu_temp_clr = wibox.widget.background()

local cpu_temp = wibox.widget({
	{
		widget = awful.widget.watch("bash -c 'cat /sys/class/thermal/thermal_zone0/temp'", 3, function(widget, stdout)
			local temp = tonumber(stdout) / 1000
			local color = ""

			if temp > 80 then
				color = beautiful.palette.bright_red
			elseif temp > 60 then
				color = beautiful.palette.bright_orange
			else
				color = beautiful.palette.bright_green
			end

			widget:set_markup(" " .. markup_clr(temp, color) .. "°C")
		end),
	},
	left = 10,
	right = 10,
	top = 3,
	bottom = 3,
	widget = wibox.container.margin,
})

cpu_temp_clr:set_widget(cpu_temp)
-- cpu_temp_clr:set_fg(beautiful.widget_fg)
-- cpu_temp_clr:set_shape(gears.shape.rectangle)
-- cpu_temp_clr:set_bg(beautiful.widget_bg)

M.widget = cpu_temp_clr

return M
