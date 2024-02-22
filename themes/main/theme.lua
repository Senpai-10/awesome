---------------------------
-- My main awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_xdg_config_home() .. "awesome/themes/"
local gruvbox = require("themes.main.gruvbox")

local theme = {}

theme.palette = gruvbox.palette

theme.font_name = "Iosevka Storm"
theme.font_size = "12"
theme.font = theme.font_name .. " " .. theme.font_size

theme.bg_normal = theme.palette.dark0
theme.bg_focus = theme.palette.dark1
theme.bg_urgent = theme.palette.bright_red
theme.bg_minimize = theme.palette.gray
theme.bg_systray = theme.palette.dark0

theme.fg_normal = theme.palette.light4
theme.fg_focus = theme.palette.light0_hard
theme.fg_urgent = theme.palette.bright_red
theme.fg_minimize = theme.palette.light1

theme.useless_gap = dpi(0)
theme.border_width = dpi(2)
theme.gap_single_client = false
theme.border_normal = theme.palette.gray
theme.border_focus = theme.palette.bright_yellow
theme.border_marked = theme.palette.bright_red

theme.widget_bg = theme.palette.dark1
theme.widget_fg = theme.palette.light3

-- theme.widget_separator = " ⏽ "
-- theme.widget_separator = "  "
theme.widget_separator = " "

theme.tag_icon = " " .. " " .. " "
-- theme.tag_icon = "    "
-- theme.tag_icon = "   "
-- theme.tag_icon = "   "
-- theme.tag_icon_selected = "   "

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

theme.taglist_fg_focus = theme.fg_focus
theme.taglist_bg_focus = theme.bg_focus

theme.taglist_fg_occupied = theme.fg_focus
theme.taglist_fg_urgent = theme.palette.bright_red
theme.taglist_fg_empty = theme.fg_normal
theme.taglist_spacing = 0
theme.taglist_font = theme.font

-- prompt_[fg|bg|fg_cursor|bg_cursor|font]

theme.prompt_bg = theme.widget_bg
theme.prompt_font = theme.font

-- theme.tasklist_disable_task_name = true

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

theme.notification_font = theme.font
theme.notification_fg = theme.fg_normal
theme.notification_bg = theme.bg_normal
-- theme.notification_width = dpi(300)
-- theme.notification_height = dpi(80)
theme.notification_margin = dpi(10)
theme.notification_border_color = theme.palette.bright_blue

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

-- theme.menu_submenu_icon = themes_path.."main/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)
theme.menu_border_width = dpi(1)
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus = theme.fg_focus
theme.menu_bg_focus = theme.bg_focus
-- theme.menu_submenu = " "
theme.menu_submenu = " "

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "main/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "main/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "main/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "main/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "main/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "main/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "main/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "main/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "main/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "main/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "main/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "main/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "main/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "main/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "main/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "main/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "main/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "main/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "main/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "main/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "main/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "main/layouts/fairvw.png"
theme.layout_floating = themes_path .. "main/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "main/layouts/magnifierw.png"
theme.layout_max = themes_path .. "main/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "main/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "main/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "main/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "main/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "main/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "main/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "main/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "main/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "main/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "main/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "main/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
