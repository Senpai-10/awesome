local awful = require("awful")

return {
	{
		"discover overlay",
		function()
			awful.spawn("discover-overlay")
		end,
	},
	{
		"gnome calculator",
		function()
			awful.spawn("gnome-calculator")
		end,
	},
	{
		"nemo",
		function()
			awful.spawn("nemo")
		end,
	},
	{
		"nitrogen",
		function()
			awful.spawn("nitrogen")
		end,
	},
	{
		"screenkey",
		function()
			awful.spawn("screenkey")
		end,
	},
	{
		"flameshot",
		function()
			awful.spawn("flameshot gui")
		end,
	},
}
