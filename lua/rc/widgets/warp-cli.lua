local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers").get_script
local gears = require("gears")

local M = {}

local widget = awful.widget.watch("bash -c " .. get_script("warp-status.sh"), 3, function(w, stdout)
	w:set_markup(stdout)
end)

widget:buttons(awful.util.table.join(awful.button({}, 1, function()
	awful.spawn(get_script("warp-menu.sh"))
end)))

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
