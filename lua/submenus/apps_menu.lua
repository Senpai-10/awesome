local awful = require("awful")

local accessories_menu = require("lua.submenus.accessories_menu")
local graphics_menu = require("lua.submenus.graphics_menu")
local internet_menu = require("lua.submenus.internet_menu")
local office_menu = require("lua.submenus.office_menu")
local preferences_menu = require("lua.submenus.preferences_menu")
local programming_menu = require("lua.submenus.programming_menu")
local sound_and_video_menu = require("lua.submenus.sound_and_video_menu")
local system_tools_menu = require("lua.submenus.system_tools_menu")

return {
    {
        "accessories",
        accessories_menu
    },
    {
        "graphics",
        graphics_menu
    },
    {
        "internet",
        internet_menu
    },
    {
        "office",
        office_menu
    },
    {
        "preferences",
        preferences_menu
    },
    {
        "programming",
        programming_menu
    },
	{
		"Sound & Video",
		sound_and_video_menu,
	},
	{
		"System Tools",
		system_tools_menu,
	},
}
