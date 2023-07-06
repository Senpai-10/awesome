local awful = require("awful")

return {
	{
		"lxappearance",
		function()
			awful.spawn("lxappearance")
		end,
	},
	{
		"YAD settings",
		function()
			awful.spawn("yad-settings")
		end,
	},
}
