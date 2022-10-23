local awful = require("awful")

return {
    {
        "Firefox browser",
        function()
            awful.spawn("firefox")
        end,
    },
    {
		"Brave browser",
		function()
			awful.spawn("brave")
		end,
	},
    {
        "discord",
        function ()
            awful.spawn("/usr/bin/discord")
        end
    },
    {
        "element desktop",
        function ()
            awful.spawn("/usr/bin/element-desktop")
        end
    },
    {
        "filezilla",
        function ()
            awful.spawn("filezilla")
        end
    },
    {
        "hyperbeam",
        function ()
            awful.spawn("hyperbeam")
        end
    },
    {
        "steam",
        function ()
            awful.spawn("steam")
        end
    },
    {
        "telegram desktop",
        function ()
            awful.spawn("telegram-desktop")
        end
    },
    {
		"Torrent client (transmission-gtk)",
		function()
			awful.spawn("transmission-gtk")
		end,
	},
    {
        "wireshark",
        function ()
            awful.spawn("wireshark")
        end
    },
}
