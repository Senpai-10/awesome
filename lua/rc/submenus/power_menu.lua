local awful = require("awful")

return {
	{
		"Poweroff",
		function()
			awful.spawn.with_shell("systemctl poweroff")
		end,
	},
	{
		"Reboot",
		function()
			awful.spawn.with_shell("systemctl reboot")
		end,
	},
	{
		-- Suspend saves its state to the RAM
		"Suspend (RAM)",
		function()
			awful.spawn.with_shell("systemctl suspend")
		end,
	},
	{
		-- Hibernate, or Suspend to Disk
		"Hibernate (DISK)",
		function()
			awful.spawn.with_shell("systemctl hibernate")
		end,
	},
	{
		-- hybrid-sleep Hibernate and suspend the system
		-- 	so the power on is faster than powering on a computer 
		-- 	and restoring the state manually.
		"Hybrid sleep",
		function()
			awful.spawn.with_shell("systemctl hybrid-sleep")
		end
	},
	{
		"Quit",
		function()
			awesome.quit()
		end,
	},
}
