local M = {}

M.terminal = os.getenv("TERMINAL") or "alacritty"
M.editor = os.getenv("EDITOR") or "nvim"
M.files_manager = os.getenv("FILEMANAGER") or "nemo"
M.music_player = "cmus"

M.editor_cmd = M.terminal .. " -e " .. M.editor

M.modkey = "Mod4"

return M
