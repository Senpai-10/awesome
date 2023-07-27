local M = {}

M.cmus = require("lua.rc.widgets.cmus").widget
M.network = require("lua.rc.widgets.network").widget
M.keyboardlayout = require("lua.rc.widgets.keyboardlayout").widget
M.weather = require("lua.rc.widgets.weather").widget
M.uptime = require("lua.rc.widgets.uptime").widget
M.cpu_usage = require("lua.rc.widgets.cpu-usage").widget
M.cpu_temp = require("lua.rc.widgets.cpu-temp").widget
M.ram_usage = require("lua.rc.widgets.ram-usage").widget
M.timeclock = require("lua.rc.widgets.timeclock").widget

return M
