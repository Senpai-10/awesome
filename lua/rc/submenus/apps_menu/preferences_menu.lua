local awful = require("awful")

return {
	{
		"lxappearance",
		function()
			awful.spawn("lxappearance")
		end,
	},
	{
		"qt5ct",
		function()
			awful.spawn("qt5ct")
		end,
	},
	{
		"YAD settings",
		function()
			awful.spawn("yad-settings")
		end,
	},
}
