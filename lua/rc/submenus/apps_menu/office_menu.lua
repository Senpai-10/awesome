local awful = require("awful")

return {
    {
        "notion-app",
        function()
            awful.spawn("/opt/Notion/notion-app")
        end,
    },
    {
        "Document Viewer (evince)",
        function()
            awful.spawn("evince")
        end,
    },
    {
        "LibreOffice",
        function ()
            awful.spawn("libreoffice")
        end
    },
    {
        "LibreOffice Base",
        function ()
            awful.spawn("libreoffice --base")
        end
    },
    {
        "LibreOffice Calc",
        function ()
            awful.spawn("libreoffice --calc")
        end
    },
    {
        "LibreOffice Draw",
        function ()
            awful.spawn("libreoffice --draw")
        end
    },
    {
        "LibreOffice Impress",
        function ()
            awful.spawn("libreoffice --impress")
        end
    },
    {
        "LibreOffice Math",
        function ()
            awful.spawn("libreoffice --math")
        end
    },
    {
        "LibreOffice Writer",
        function ()
            awful.spawn("libreoffice --writer")
        end
    },
}
