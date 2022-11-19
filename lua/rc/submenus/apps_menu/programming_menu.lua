local awful = require("awful")
local default = require("lua.rc.default")

return {
    {
        "Code - OSS",
        function ()
            awful.spawn("code-oss --unity-launch")
        end
    },
    {
		"gedit",
		function()
			awful.spawn("gedit")
		end,
	},
	{
		"nvim-qt",
		function()
			awful.spawn("nvim-qt")
		end,
	},
	{
		"nvim",
		function()
			awful.spawn(default.terminal .. " -e nvim")
		end,
	},
    {
        "DBeaver Community",
        function ()
            awful.spawn("dbeaver")
        end
    },
}
