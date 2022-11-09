local accessories_menu = require("lua.rc.submenus.apps_menu.accessories_menu")
local graphics_menu = require("lua.rc.submenus.apps_menu.graphics_menu")
local internet_menu = require("lua.rc.submenus.apps_menu.internet_menu")
local office_menu = require("lua.rc.submenus.apps_menu.office_menu")
local preferences_menu = require("lua.rc.submenus.apps_menu.preferences_menu")
local programming_menu = require("lua.rc.submenus.apps_menu.programming_menu")
local sound_and_video_menu = require("lua.rc.submenus.apps_menu.sound_and_video_menu")
local system_tools_menu = require("lua.rc.submenus.apps_menu.system_tools_menu")

return {
	{
		"accessories",
		accessories_menu,
	},
	{
		"graphics",
		graphics_menu,
	},
	{
		"internet",
		internet_menu,
	},
	{
		"office",
		office_menu,
	},
	{
		"preferences",
		preferences_menu,
	},
	{
		"programming",
		programming_menu,
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
