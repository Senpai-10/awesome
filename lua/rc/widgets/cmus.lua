local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local truncate_string = require("lua.helpers.truncate_string").truncate_string
local gears = require("gears")

local M = {}

--{{{ Get cmus PID to check if it is running
local function getCmusPid()
	local fpid = io.popen("pgrep cmus")
	if fpid then
		local pid = fpid:read("*n")
		fpid:close()
		return pid
	end
end --}}}

--{{{ Enable cmus control
function M.cmus_cmd(action)
	local cmus_info, cmus_state
	local cmus_run = getCmusPid()
	if cmus_run then
		cmus_info = io.popen("cmus-remote -Q"):read("*all")
		cmus_state = string.gsub(string.match(cmus_info, "status %a*") or "", "status ", "")
		if cmus_state ~= "stopped" then
			if action == "next" then
				io.popen("cmus-remote -n")
			elseif action == "previous" then
				io.popen("cmus-remote -r")
			elseif action == "stop" then
				io.popen("cmus-remote -s")
			end
		end
		if action == "play_pause" then
			if cmus_state == "playing" or cmus_state == "paused" then
				io.popen("cmus-remote -u")
			elseif cmus_state == "stopped" then
				io.popen("cmus-remote -p")
			end
		end
	end
end --}}}

-- Cmus Widget
local function hook_cmus() --{{{
	-- check if cmus is running
	local cmus_run = getCmusPid()

	if cmus_run then
		local cmus_info = io.popen("cmus-remote -Q"):read("*all")
		local cmus_state = string.gsub(string.match(cmus_info, "status %a*") or "", "status ", "")
		local cmus_string = ""

		if cmus_state == "playing" or cmus_state == "paused" then
			local cmus_artist = string.match(cmus_info, "tag artist %C*")
			if cmus_artist == nil then
				cmus_artist = "unknown artist"
			else
				cmus_artist = string.gsub(cmus_artist, "tag artist ", "")
			end

			local cmus_title = string.match(cmus_info, "tag title %C*")
			if cmus_title == nil then
				cmus_title = "unknown title"
			else
				cmus_title = string.gsub(cmus_title, "tag title ", "")
			end

			-- cut the string off it its more than 15 chars
			cmus_artist = truncate_string(cmus_artist, 15)
			cmus_title = truncate_string(cmus_title, 15)

			local cmus_curtime = string.gsub(string.match(cmus_info, "position %d*"), "position ", "")
			local cmus_curtime_formated = math.floor(cmus_curtime / 60)
				.. ":"
				.. string.format("%02d", cmus_curtime % 60)
			local cmus_totaltime = string.gsub(string.match(cmus_info, "duration %d*"), "duration ", "")
			local cmus_totaltime_formated = math.floor(cmus_totaltime / 60)
				.. ":"
				.. string.format("%02d", cmus_totaltime % 60)

            local vol_left = string.gsub(string.match(cmus_info, "set vol_left %d*"), "set vol_left ", "")
            local vol_right = string.gsub(string.match(cmus_info, "set vol_right %d*"), "set vol_right ", "")
            local volume = ""

            if vol_left == vol_right then
                volume = "vol: " .. vol_left
            else
                volume = "vol_l: " .. vol_left .. " vol_r: " .. vol_right
            end

			cmus_string = cmus_artist
				.. " - "
				.. cmus_title
				.. " ("
				.. cmus_curtime_formated
				.. "/"
				.. cmus_totaltime_formated
				.. ")"
                .. " "
                .. volume
			if cmus_state == "paused" then
				cmus_string = "|| " .. cmus_string .. ""
			else
				cmus_string = "> " .. cmus_string .. ""
			end
			cmus_string = cmus_string

			-- remove "&" from the span field
			return cmus_string
		else
			cmus_string = "cmus is not playing"
		end
		return cmus_string
	else
		return "cmus is not running"
	end
end --}}}

M.widget = {
	{
		{
			widget = awful.widget.watch("cmus", 1, function(widget)
				widget:set_text(hook_cmus())
			end),
		},
		left = 10,
		right = 10,
		top = 3,
		bottom = 3,
		widget = wibox.container.margin,
	},
	fg = beautiful.widget_fg,
	-- bg = "#7476e8",
	bg = beautiful.widget_bg,
    shape = gears.shape.rounded_rect,
	widget = wibox.container.background,
}

return M
