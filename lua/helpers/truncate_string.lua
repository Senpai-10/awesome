-- cut off string after n number of chars

local M = {}

---@param string string string you provide
---@param number integer number to cut off chars after
---@return string
M.truncate_string = function(string, number)
	if string.len(string) > number then
		string = string.sub(string, 1, number)
		string = string .. "..."
	end

	return string
end

return M
