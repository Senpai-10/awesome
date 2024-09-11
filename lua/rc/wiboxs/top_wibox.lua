local awful = require("awful")
local wibox = require("wibox")

local M = {}

function M.setup(screen)
	screen.top_wibox = awful.wibar({ position = "top", screen = screen, height = 40 })

	screen.top_wibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.align.horizontal,
			screen.mytaglist,
		},
		{
			layout = wibox.layout.align.horizontal,
			screen.mypromptbox,
		},
		{
			layout = wibox.layout.align.horizontal,
			screen.mytasklist,
		},
	})
end

return M
