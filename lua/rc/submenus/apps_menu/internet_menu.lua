local awful = require("awful")

return {
	{
		"Firefox browser",
		function()
			awful.spawn("firefox")
		end,
	},
	{
		"discord",
		function()
			awful.spawn("/usr/bin/discord")
		end,
	},
	{
		"steam",
		function()
			awful.spawn("steam")
		end,
	},
	{
		"Torrent client (transmission-gtk)",
		function()
			awful.spawn("transmission-gtk")
		end,
	},
	{
		"wireshark",
		function()
			awful.spawn("wireshark")
		end,
	},
}
