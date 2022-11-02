local awful = require("awful")

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
			awful.spawn(TERMINAL .. " -e nvim")
		end,
	},
    {
        "DBeaver Community",
        function ()
            awful.spawn("dbeaver")
        end
    },
}
