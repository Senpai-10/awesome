local awful = require("awful")

local menu_applications = {
	{
		"Brave browser",
		function()
			awful.spawn.with_shell("brave")
		end,
	},
	{
		"Firefox browser",
		function()
			awful.spawn.with_shell("firefox")
		end,
	},
	{
		"Torrent client",
		function()
			awful.spawn.with_shell("transmission-gtk")
		end,
	},
	{
		"Nemo",
		function()
			awful.spawn.with_shell("nemo")
		end,
	},
	{
		"Jgmenu",
		function()
			awful.spawn.with_shell("jgmenu")
		end,
	},
	{
		"gnome-system-monitor",
		function()
			awful.spawn.with_shell("gnome-system-monitor")
		end,
	},
	{
		"system-monitoring-center",
		function()
			awful.spawn.with_shell("system-monitoring-center")
		end,
	},
	{
		"spotify",
		function()
			awful.spawn.with_shell("spotify")
		end,
	},
	{
		"notion-app",
		function()
			awful.spawn.with_shell("/opt/Notion/notion-app")
		end,
	},
	{
		"figma",
		function()
			awful.spawn.with_shell(
				"/opt/figma-linux/figma-linux --no-sandbox --enable-oop-rasterization --ignore-gpu-blacklist -enable-experimental-canvas-features --enable-accelerated-2d-canvas --force-gpu-rasterization --enable-fast-unload --enable-accelerated-vpx-decode=3 --enable-tcp-fastopen --javascript-harmony --enable-checker-imaging --v8-cache-options=code --v8-cache-strategies-for-cache-storage=aggressive --enable-zero-copy --ui-enable-zero-copy --enable-native-gpu-memory-buffers --enable-webgl-image-chromium --enable-accelerated-video --enable-gpu-rasterization"
			)
		end,
	},
}

local menu_power = {
	{
		"Poweroff",
		function()
			awful.spawn.with_shell("poweroff")
		end,
	},
	{
		"Reboot",
		function()
			awful.spawn.with_shell("reboot")
		end,
	},
	{
		"Quit",
		function()
			awesome.quit()
		end,
	},
}

return awful.menu({
	items = {
		{ "Applications", menu_applications },
		{
			"Hotkeys",
			function()
				hotkeys_popup.show_help(nil, awful.screen.focused())
			end,
		},
		{ "Open terminal", terminal },
		{ "Manage todos", editor_cmd .. " /home/senpai/.todo" },
		{
			"Restart imwheel",
			function()
				awful.spawn.with_shell("killall imwheel && imwheel -b 45")
			end,
		},
		{ "Restart awesome", awesome.restart },
		{ "Power menu", menu_power },
		{
			"Lock Xserver",
			function()
				awful.spawn.with_shell("xtrlock")
			end,
		},
		{ "Close", "" },
	},
	theme = { width = 400, height = 23 },
})
