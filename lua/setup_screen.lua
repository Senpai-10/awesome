local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local gfs = require("gears.filesystem")
-- local beautiful = require("beautiful")
-- local mymainmenu = require("lua.menus")
-- local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

local scripts_dir = gfs.get_xdg_config_home() .. "awesome/scripts/"

local function get_script(name)
    return scripts_dir .. name
end

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock("%A %F %l:%M:%S %P ", 1)

-- local separator = wibox.widget.textbox(" ⏽ ")
local separator = wibox.widget.textbox("  ")

local taglist_buttons = require("lua.taglist_buttons")
local tasklist_buttons = require("lua.tasklist_buttons")

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

	-- Create the wibox
	s.top_wibox = awful.wibar({ position = "top", screen = s, height = 22 })
	s.bottom_wibox = awful.wibar({ position = "bottom", screen = s, height = 28 })

	s.top_wibox:setup({
		layout = wibox.layout.align.horizontal,
		s.mypromptbox,
		{
			layout = wibox.layout.align.horizontal,

			-- s.mytasklist, -- Middle widget
			s.mytaglist,
		},
		s.mytasklist,
	})

	-- Add widgets to the wibox
	s.bottom_wibox:setup({
		layout = wibox.layout.align.horizontal,
		-- { -- Left widgets
		-- 	layout = wibox.layout.fixed.horizontal,
		-- 	mylauncher,
		-- },
		nil,
		-- s.mytasklist, -- Middle widget
		nil,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
            awful.widget.watch("bash -c " .. get_script("network.sh"), 300),
			separator,
			awful.widget.watch("bash -c " .. get_script("updates.sh"), 1800),
			separator,
			mykeyboardlayout,
			separator,
			awful.widget.watch("bash -c " .. get_script("weather.sh"), 120),
			separator,
			awful.widget.watch("bash -c " .. get_script("uptime.sh"), 15),
			separator,
			awful.widget.watch("bash -c " .. get_script("cpu-usage.sh"), 3),
			separator,
			awful.widget.watch("bash -c " .. get_script("cpu-temp.sh"), 3),
			separator,
			awful.widget.watch("bash -c " .. get_script("ram-usage.sh"), 3),
			separator,
			mytextclock,
			wibox.widget.systray(),
			s.mylayoutbox,
		},
		nil,
	})
end

return M
