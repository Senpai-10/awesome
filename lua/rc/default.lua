local beautiful = require("beautiful")

local M = {}

M.terminal = os.getenv("TERMINAL") or "alacritty"
M.editor = os.getenv("EDITOR") or "vim"
M.files_manager = os.getenv("FILEMANAGER")
M.music_player = "cmus"

M.editor_cmd = M.terminal .. " -e " .. M.editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
M.modkey = "Mod4"

M.tag_icon = beautiful.tag_icon or "[tag]"
M.tag_icon_selected = beautiful.tag_icon_selected or "[selected tag]"

return M
