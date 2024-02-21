local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")
local markup_clr = require("lua.helpers.markup_clr")

local M = {}

M.widget = {
	{

		{
			widget = awful.widget.watch(
				"bash -c 'cat /sys/class/thermal/thermal_zone0/temp'",
				3,
				function(widget, stdout)
					local temp = math.floor(tonumber(stdout) / 1000)
					local color = ""

					if temp > 80 then
						color = beautiful.palette.bright_red
					elseif temp > 60 then
						color = beautiful.palette.bright_orange
					else
						color = beautiful.palette.bright_green
					end

					widget:set_markup(" " .. markup_clr(temp .. "°C", color))
				end
			),
		},
		left = 10,
		right = 10,
		top = 3,
		bottom = 3,
		widget = wibox.container.margin,
	},
	widget = wibox.widget.background(),
}

return M
