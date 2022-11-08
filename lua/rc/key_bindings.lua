local hotkeys_popup = require("awful.hotkeys_popup")
local gears = require("gears")
local awful = require("awful")
local cyclefocus = require("cyclefocus")
local beautiful = require("beautiful")
local mymainmenu = require("lua.rc.menus")

local tag_management = require("lua.rc.tag_management")

local globalkeys = gears.table.join(
	awful.key({ MODKEY, "Control", "Shift" }, 0, function()
		local default_gap = beautiful.get().useless_gap
		awful.tag.setgap(default_gap)
	end, { description = "set gaps to default value", group = "awesome" }),

	awful.key({ MODKEY, "Control" }, "=", function()
		local current_gap = awful.tag.getgap()
		awful.tag.setgap(current_gap + 1)
	end, { description = "increase gaps", group = "awesome" }),

	awful.key({ MODKEY, "Control" }, "-", function()
		local current_gap = awful.tag.getgap()
		awful.tag.setgap(current_gap - 1)
	end, { description = "decrease gaps", group = "awesome" }),

	awful.key({ MODKEY }, "a", tag_management.add_tag, { description = "add a tag", group = "tag" }),

	awful.key(
		{ MODKEY, "Shift" },
		"a",
		tag_management.delete_tag,
		{ description = "delete the current tag", group = "tag" }
	),

	awful.key(
		{ MODKEY, "Control" },
		"a",
		tag_management.move_to_new_tag,
		{ description = "add a tag with the focused client", group = "tag" }
	),

	awful.key(
		{ MODKEY, "Mod1" },
		"a",
		tag_management.copy_tag,
		{ description = "create a copy of the current tag", group = "tag" }
	),

	awful.key(
		{ MODKEY, "Shift" },
		"r",
		tag_management.rename_tag,
		{ description = "rename the current tag", group = "tag" }
	),

	awful.key({ MODKEY }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ MODKEY }, "[", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ MODKEY }, "]", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ MODKEY }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ MODKEY }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ MODKEY }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ MODKEY }, "w", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	awful.key({ MODKEY }, "b", function()
		for s in screen do
            if s.top_wibox then
                s.top_wibox.visible = not s.top_wibox.visible
            end

            if s.bottom_wibox then
                s.bottom_wibox.visible = not s.bottom_wibox.visible
            end
		end
	end, { description = "hide all bars", group = "awesome" }),

	-- Layout manipulation
	awful.key({ MODKEY, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ MODKEY, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ MODKEY, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ MODKEY, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ MODKEY }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	--awful.key({ MODKEY }, "Tab",
	--    function ()
	--        awful.client.focus.history.previous()
	--        if client.focus then
	--            client.focus:raise()
	--        end
	--    end,
	--    {description = "go back", group = "client"}),

	-- Alt-Tab: cycle through clients on the same screen.
	-- This must be a clientkeys mapping to have source_c available in the callback.
	cyclefocus.key({ "Mod1" }, "Tab", {
		-- cycle_filters as a function callback:
		-- cycle_filters = { function (c, source_c) return c.screen == source_c.screen end },

		-- cycle_filters from the default filters:
		cycle_filters = { cyclefocus.filters.same_screen, cyclefocus.filters.common_tag },
		keys = { "Tab", "ISO_Left_Tab" }, -- default, could be left out
	}),

	-- Standard program
	awful.key({ MODKEY }, "Return", function()
		awful.spawn(TERMINAL)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ MODKEY }, "e", function()
		awful.spawn(FILES_MANAGER)
	end, { description = "open file manager", group = "launcher" }),
	awful.key({ MODKEY, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ MODKEY, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	awful.key({ MODKEY }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ MODKEY }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ MODKEY, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ MODKEY, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ MODKEY, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ MODKEY, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

	--awful.key({ MODKEY, "Shift"}, "p", function () awful.layout.inc(1) end,
	--          {description = "select next", group = "layout"}),

	-- awful.key({ MODKEY, "Alt", "Shift" }, "p", function () awful.layout.inc(-1) end,
	--           {description = "select previous", group = "layout"}),

	awful.key({ MODKEY, "Control" }, "p", function()
		awful.spawn("flameshot gui")
	end, { description = "screenshot with selection", group = "scrot" }),

	awful.key({ MODKEY, "Shift" }, "p", function()
		awful.spawn.with_shell("picker")
	end, { description = "color picker", group = "awesome" }),

	awful.key({ MODKEY, "Control" }, "s", function()
		awful.spawn("flameshot full")
	end, { description = "screenshot fullscreen", group = "scrot" }),

	awful.key({ MODKEY, "Control", "Shift" }, "s", function()
		awful.spawn("flameshot full -c")
	end, { description = "screenshot fullscreen and save to clipboard", group = "scrot" }),

	awful.key({ MODKEY, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- change layout
	awful.key({ MODKEY }, "space", function()
		awful.spawn.with_shell("~/scripts/./change_layout")
	end, { description = "change keyboard layout", group = "awesome" }),

	awful.key({ MODKEY, "Shift" }, "e", function()
		awful.spawn("easy_edit")
	end, { description = "Show list of files/dir to open in $EDITOR", group = "awesome" }),

	-- Prompt
	-- awful.key({ MODKEY },            "r",     function () awful.screen.focused().mypromptbox:run() end,
	--           {description = "run prompt", group = "launcher"}),

	awful.key({ MODKEY }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua.rc.execute prompt", group = "awesome" }),
	-- Menubar
	awful.key({ MODKEY }, "r", function()
		awful.spawn("dmenu_run")
	end, { description = "run dmenu", group = "launcher" }),

	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("playerctl-wrapper volume 0.2+")
	end, { description = "raise volume", group = "function keys" }),

	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("playerctl-wrapper volume 0.2-")
	end, { description = "lower volume", group = "function keys" }),

	awful.key({}, "XF86AudioMute", function()
		awful.spawn("playerctl-wrapper volume 0.0")
	end, { description = "mute audio", group = "function keys" }),

	awful.key({}, "XF86AudioPlay", function()
		awful.spawn("playerctl-wrapper play-pause")
	end, { description = "play audio", group = "function keys" }),

	awful.key({}, "XF86AudioStop", function()
		awful.spawn("playerctl-wrapper stop")
	end, { description = "stop audio", group = "function keys" }),

	awful.key({}, "XF86AudioNext", function()
		awful.spawn("playerctl-wrapper next")
	end, { description = "play next audio", group = "function keys" }),

	awful.key({}, "XF86AudioPrev", function()
		awful.spawn("playerctl-wrapper previous")
	end, { description = "play previous audio", group = "function keys" }),

	awful.key({}, "XF86Tools", function()
		awful.spawn(TERMINAL .. " -e " .. MUSIC_PLAYER)
	end, { description = "launch music player", group = "function keys" }),

	awful.key({}, "XF86Calculator", function()
		awful.spawn("gnome-calculator")
	end, { description = "launch calculator", group = "function keys" })

	-- -- Menubar
	-- awful.key({ MODKEY }, "p", function() menubar.show() end,
	--           {description = "show the menubar", group = "launcher"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ MODKEY }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ MODKEY, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ MODKEY, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ MODKEY, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

return globalkeys
