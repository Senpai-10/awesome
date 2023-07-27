local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local get_script = require("lua.helpers.get_script").get_script
local gears = require("gears")
local naughty = require("naughty")
local default = require("lua.rc.default")

local watch_widget = awful.widget.watch("bash -c " .. get_script("updates.sh"), 1800)

watch_widget:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		awful.spawn(default.terminal .. " -e " .. "sudo pacman -Syu")
	end

	-- right mouse button
	if button == 3 then
		local result = io.popen("checkupdates"):read("*a")

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
	shape = gears.shape.rectangle,
	widget = wibox.container.background,
}

return M
