local awful = require("awful")

return {
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
