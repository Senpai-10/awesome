local awful = require("awful")

return {
	{
		"gnome-system-monitor",
		function()
			awful.spawn("gnome-system-monitor")
		end,
	},
	{
		"virt manager",
		function()
			awful.spawn("virt-manager")
		end,
	},
	{
		"VirtualBox",
		function()
			awful.spawn("VirtualBox")
		end,
	},
	{
		"cpu-x",
		function()
			awful.spawn("cpu-x")
		end,
	},
	{
		"gparted",
		function()
			awful.spawn("gparted")
		end,
	},
	{
		"alacritty",
		function()
			awful.spawn("alacritty")
		end,
	},
	{
		"kitty",
		function()
			awful.spawn("kitty")
		end,
	},
}
