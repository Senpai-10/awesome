local awful = require("awful")

local accessories_menu = require("lua.rc.submenus.accessories_menu")
local graphics_menu = require("lua.rc.submenus.graphics_menu")
local internet_menu = require("lua.rc.submenus.internet_menu")
local office_menu = require("lua.rc.submenus.office_menu")
local preferences_menu = require("lua.rc.submenus.preferences_menu")
local programming_menu = require("lua.rc.submenus.programming_menu")
local sound_and_video_menu = require("lua.rc.submenus.sound_and_video_menu")
local system_tools_menu = require("lua.rc.submenus.system_tools_menu")

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
