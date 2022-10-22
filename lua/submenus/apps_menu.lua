local awful = require("awful")

local sound_and_video_menu = require("lua.submenus.sound_and_video_menu")
local system_tools_menu = require("lua.submenus.system_tools_menu")

return {
	{
		"Brave browser",
		function()
			awful.spawn("brave")
		end,
	},
	{
		"Firefox browser",
		function()
			awful.spawn("firefox")
		end,
	},
	{
		"Torrent client",
		function()
			awful.spawn("transmission-gtk")
		end,
	},
	{
		"Jgmenu",
		function()
			awful.spawn("jgmenu")
		end,
	},
	{
		"notion-app",
		function()
			awful.spawn("/opt/Notion/notion-app")
		end,
	},
	{
		"figma",
		function()
			awful.spawn(
				"/opt/figma-linux/figma-linux --no-sandbox --enable-oop-rasterization --ignore-gpu-blacklist -enable-experimental-canvas-features --enable-accelerated-2d-canvas --force-gpu-rasterization --enable-fast-unload --enable-accelerated-vpx-decode=3 --enable-tcp-fastopen --javascript-harmony --enable-checker-imaging --v8-cache-options=code --v8-cache-strategies-for-cache-storage=aggressive --enable-zero-copy --ui-enable-zero-copy --enable-native-gpu-memory-buffers --enable-webgl-image-chromium --enable-accelerated-video --enable-gpu-rasterization"
			)
		end,
	},
    -- accessories
    -- games
    -- graphics
    -- internet
    -- office
    -- other
    -- Preferences
    -- programming
    {
        "Sound & Video",
        sound_and_video_menu
    },
    {
        "System Tools",
        system_tools_menu
    }
}

