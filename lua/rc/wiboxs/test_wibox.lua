local awful = require("awful")
local wibox = require("wibox")

local M = {}

local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")
function M.setup(screen)
	-- to get the same light colors
	-- set HSV's last % to 91

	local separator = screen.separator

	-- Create the wibox
	screen.bottom_wibox = awful.wibar({
		position = "bottom",
		screen = screen,
		height = 35,
	})

	-- Add widgets to the wibox
	screen.bottom_wibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			-- [[ widget
			{
				{
					{
						widget = awful.widget.watch("bash -c " .. get_script("cpu-temp.sh"), 3),
					},
					left = 15,
					right = 15,
					top = 3,
					bottom = 3,
					widget = wibox.container.margin,
				},
				fg = beautiful.widget_fg,
				bg = beautiful.widget_bg,
                shape = gears.shape.rounded_rect,
				widget = wibox.container.background,
			},
			-- ]]
			left = 5,
			right = 5,
			top = 5,
			bottom = 5,
			widget = wibox.container.margin,
		},
	})
end

return M
