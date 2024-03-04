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
		"Suspend",
		function()
			awful.spawn.with_shell("systemctl suspend")
		end,
	},
	{
		"Quit",
		function()
			awesome.quit()
		end,
	},
}
