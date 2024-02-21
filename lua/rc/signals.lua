local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local function get_tags_menu_items(c)
	local output = {}

	for index, tag in pairs(root.tags()) do -- luacheck: globals root
		table.insert(output, {
			-- [idx] tag_name
			"["
				.. index
				.. "]"
				.. " "
				.. tag.name,
			function()
				c:move_to_tag(tag) -- luacheck: globals root
			end,
		})
	end

	return output
end

-- {{{ Signals

-- tag.connect_signal("property::selected", function (tag)
--     if tag.name == TAG_ICON then
--         tag.name = TAG_ICON_SELECTED
--     end
--     naughty.notify({text='some message'})
-- end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end

	-- change clients shape
	c.shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 5)
	end

	if c.floating then
		awful.titlebar.show(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 2, function()
			client.focus = c
			c:raise()

			local tags_menu = awful.menu.new(get_tags_menu_items(c))
			tags_menu:toggle()
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			-- awful.titlebar.widget.floatingbutton(c),
			-- awful.titlebar.widget.stickybutton(c),
			-- awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.minimizebutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

client.connect_signal("property::floating", function(c)
	if c.floating then
		awful.titlebar.show(c)
	else
		awful.titlebar.hide(c)
	end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	-- awful.titlebar.show(c)
	c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
	-- awful.titlebar.hide(c)
	c.border_color = beautiful.border_normal
end)
-- }}}
