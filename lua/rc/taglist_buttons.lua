local awful = require("awful")
local gears = require("gears")
local modkey = require("lua.rc.default").modkey
local tagswitch = Effects.request_effect("tagswitch")

return gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
		if tagswitch then
			local t = awful.screen.focused().selected_tag
			tagswitch.animate(tostring(t.index))
		end
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
		if tagswitch then
			local t = awful.screen.focused().selected_tag
			tagswitch.animate(tostring(t.index))
		end
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
		if tagswitch then
			local t = awful.screen.focused().selected_tag
			tagswitch.animate(tostring(t.index))
		end
	end)
)
