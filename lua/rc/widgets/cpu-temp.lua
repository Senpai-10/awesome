local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")

local M = {}

local cpu_temp_clr = wibox.widget.background()

local cpu_temp = wibox.widget({
	{
		{
			{
				id = "cpu_temp_label",
				text = " ",
				widget = wibox.widget.textbox,
			},
			fg = beautiful.widget_fg,
			widget = wibox.container.background,
		},
		{
			{
				widget = awful.widget.watch(
					"bash -c 'cat /sys/class/thermal/thermal_zone0/temp'",
					3,
					function(widget, stdout)
						local temp = tonumber(stdout) / 1000
						widget:set_text(temp)

						if temp > 80 then
							cpu_temp_clr:set_fg("#FE0000")
						elseif temp > 60 then
							cpu_temp_clr:set_fg("#FD8C00")
						else
							cpu_temp_clr:set_fg("#32CD31")
						end
					end
				),
			},
			widget = wibox.container.background,
		},
		layout = wibox.layout.align.horizontal,
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
