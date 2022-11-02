local gfs = require("gears.filesystem")

local scripts_dir = gfs.get_xdg_config_home() .. "awesome/scripts/"

local M = {}

-- helper functions
-- returns: <xdg_config_home>/awesome/scripts/
function M.get_script(name)
	return scripts_dir .. name
end

return M
