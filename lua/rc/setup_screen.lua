local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local taglist_buttons = require("lua.rc.taglist_buttons")
local tasklist_buttons = require("lua.rc.tasklist_buttons")

local M = {}

function M.setup(s)
	-- Each screen has its own tag table.
	-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
	awful.tag(
		{ TAG_ICON, TAG_ICON, TAG_ICON, TAG_ICON, TAG_ICON, TAG_ICON, TAG_ICON, TAG_ICON, TAG_ICON },
		s,
		awful.layout.layouts[1]
	)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		layout = {
			spacing = 5,

			max_widget_size = awful.screen.focused().workarea.width * 0.12,

			layout = wibox.layout.flex.horizontal,
		},
	})

    s.separator = wibox.widget.textbox(beautiful.widget_separator)

    require("lua.rc.wiboxs.top_wibox").setup(s)
    require("lua.rc.wiboxs.bottom_wibox").setup(s)
end

return M
