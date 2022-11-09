local awful = require("awful")
local wibox = require("wibox")

local widgets = require("lua.rc.widgets")

local M = {}

function M.setup(screen)
	-- to get the same light colors
	-- set HSV's last % to 91

	local separator = screen.separator

	-- Create the wibox
	screen.bottom_wibox = awful.wibar({
		position = "bottom",
		screen = screen,
		height = 28,
	})

	-- Add widgets to the wibox
	screen.bottom_wibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			widgets.cmus,
		},
		-- Middle widgets
		nil,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			widgets.network,
			separator,
			widgets.updates,
			separator,
			widgets.keyboardlayout,
			separator,
			widgets.weather,
			separator,
			widgets.uptime,
			separator,
			widgets.cpu_usage,
			separator,
			widgets.cpu_temp,
			separator,
			widgets.ram_usage,
			separator,
			widgets.timeclock,
			separator,
			wibox.widget.systray(),
			separator,
			screen.mylayoutbox,
		},
		nil,
	})
end

return M
