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
		height = 40,
	})

	-- Add widgets to the wibox
	screen.bottom_wibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- left widgets
			{
				layout = wibox.layout.fixed.horizontal,
				widgets.cmus,
			},
			left = 5,
			right = 5,
			top = 4,
			bottom = 4,
			widget = wibox.container.margin,
		},
		-- Middle widgets
		nil,
		{ -- Right widgets
			{
				layout = wibox.layout.fixed.horizontal,
				separator,
				widgets.network,
				separator,
				widgets.keyboardlayout,
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
			left = 5,
			right = 5,
			top = 4,
			bottom = 4,
			widget = wibox.container.margin,
		},
	})
end

return M
