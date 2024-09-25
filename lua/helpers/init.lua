local gfs = require("gears.filesystem")
local scripts_dir = gfs.get_xdg_config_home() .. "awesome/scripts/"

local M = {}

function M.get_script(name)
	return scripts_dir .. name
end

function M.markup_clr(s, fg)
	return "<span foreground='" .. fg .. "'>" .. s .. "</span>"
end

return M
