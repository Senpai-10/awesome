local awful = require("awful")

return {
	{
		"mpv",
		function()
			awful.spawn("mpv --player-operation-mode=pseudo-gui")
		end,
	},
	{
		"qpwgraph",
		function()
			awful.spawn("qpwgraph")
		end,
	},
	{
		"spotify",
		function()
			awful.spawn("spotify")
		end,
	},
	{
		"kdenlive",
		function()
			awful.spawn("kdenlive")
		end,
	},
}
