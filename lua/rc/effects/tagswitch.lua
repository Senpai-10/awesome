local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local fade = require("lua.rc.animations.fade")

local M = wibox({
	visible = false,
	opacity = 0,
	bg = "#17171A",
	fg = "#C7CBCC",
	ontop = true,
	height = 90,
	width = 180,
})

M.changeText = function(text)
	M:get_children_by_id("text")[1]:set_markup("<b>" .. text .. "</b>")
end

M.animate = function(text)
	M.changeText(text)
	fade(M, 200, 0.25)
end

M:setup({
	{
		id = "text",
		markup = "<b>text</b>",
		font = "JetBrainsMono Nerd Font 37",
		widget = wibox.widget.textbox,
	},
	valign = "center",
	halign = "center",
	layout = wibox.container.place,
})

awful.placement.bottom(M, { parent = awful.screen.focused(), margins = 80 })

return M
