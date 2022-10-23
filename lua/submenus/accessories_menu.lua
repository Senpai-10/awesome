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
		"bitwarden",
		function()
			awful.spawn("bitwarden-desktop")
		end,
	},
	{
		"gnome disks",
		function()
			awful.spawn("gnome-disks")
		end,
	},
	{
		"nemo",
		function()
			awful.spawn("nemo")
		end,
	},
	{
		"spacefm",
		function()
			awful.spawn("spacefm")
		end,
	},
	{
		"pcmanfm",
		function()
			awful.spawn("pcmanfm")
		end,
	},
	{
		"nitrogen",
		function()
			awful.spawn("nitrogen")
		end,
	},
	{
		"Jgmenu",
		function()
			awful.spawn("jgmenu")
		end,
	},
	{
		"screenkey",
		function()
			awful.spawn("screenkey")
		end,
	},
	{
		"gnome screenshot",
		function()
			awful.spawn("gnome-screenshot --interactive")
		end,
	},
	{
		"flameshot",
		function()
			awful.spawn("flameshot gui")
		end,
	},
}
