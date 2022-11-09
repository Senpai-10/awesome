local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")
local naughty = require("naughty")

local watch_widget = awful.widget.watch("bash -c " .. get_script("updates.sh"), 1800)

watch_widget:connect_signal("button::press", function(_, _, _, button)
	-- right mouse button
	if button == 3 then
		local handle = assert(io.popen("checkupdates"))
		local result = handle:read("*a")

		handle:close()

		naughty.notify({
			title = "Pending updates",
			text = result,
			timeout = 0,
		})
	end
end)

local M = {}

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

return M
