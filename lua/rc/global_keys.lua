local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local default = require("lua.rc.default")
local modkey = default.modkey
local terminal = default.terminal
local editor = default.editor
local editor_cmd = default.editor_cmd
local altkey = "Mod1"

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "[", function()
		awful.tag.viewprev()
	end, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "]", function()
		awful.tag.viewnext()
	end, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "w", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "e", function()
		awful.spawn(default.files_manager)
	end, { description = "open file manager", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "p", function()
		awful.spawn.with_shell("picker")
	end, { description = "color picker", group = "awesome" }),
	awful.key({ modkey, "Control" }, "p", function()
		awful.spawn("flameshot gui")
	end, { description = "screenshot with selection", group = "screenshot" }),
	awful.key({ modkey, "Control" }, "s", function()
		awful.spawn("flameshot full")
	end, { description = "screenshot fullscreen", group = "screenshot" }),
	awful.key({ modkey, "Control", "Shift" }, "s", function()
		awful.spawn("flameshot full -c")
	end, { description = "screenshot fullscreen and save to clipboard", group = "screenshot" }),
	awful.key({ modkey, altkey }, "q", function()
		awful.spawn("tmux-sessions-list")
	end, { description = "quit awesome", group = "quick list" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	-- Shows a list of executables in $PATH and can launch them (optional in a terminal).
	awful.key({ modkey }, "r", function()
		awful.spawn("rofi -show run")
	end, { description = "run launcher", group = "launcher" }),

	-- Same as the run launches, but the list is created from the installed desktop files.
	awful.key({ modkey, altkey }, "r", function()
		awful.spawn("rofi -show drun")
	end, { description = "run launcher", group = "launcher" }),
	-- change layout
	awful.key({ modkey }, "space", function()
		awful.spawn.with_shell("~/scripts/./change_layout")
	end, { description = "change keyboard layout", group = "awesome" }),

	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),

	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("playerctl-wrapper volume 0.1+")
	end, { description = "raise volume", group = "function keys" }),

	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("playerctl-wrapper volume 0.1-")
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
	awful.key({ "Shift" }, "XF86AudioNext", function()
		awful.spawn("playerctl-wrapper position 10+")
	end, { description = "seek audio 10+", group = "function keys" }),

	awful.key({ "Shift" }, "XF86AudioPrev", function()
		awful.spawn("playerctl-wrapper position 10-")
	end, { description = "seek audio 10-", group = "function keys" }),

	awful.key({}, "XF86Tools", function()
		awful.spawn(default.terminal .. " -e " .. default.music_player)
	end, { description = "launch music player", group = "function keys" }),

	awful.key({}, "XF86Calculator", function()
		awful.spawn("gnome-calculator")
	end, { description = "launch calculator", group = "function keys" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

-- Set keys
root.keys(globalkeys)
-- }}}
