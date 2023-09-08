--[[
Some basic shared functionality that would be nice if it was built into Lua or just is heavily used by the code exercises. Common functions like count lenght of table, sorting list and such.
--]]

local basic = {}

basic.len = function(tbl)
	local c = 0
	for _, _ in pairs(tbl) do
		c = c + 1
	end
	return c
end

basic.max = function(tbl)
	local m = nil
	for _, v in pairs(tbl) do
		if m == nil and v ~= nil then
			m = v
		end
		if v > m then
			m = v
		end
	end
	return m
end

basic.print_table = function(tbl)
	for i, v in pairs(tbl) do
		print("key: " .. i .. " vvalue: " .. v)
	end
end

basic.generate_table = function(l)
	local t = {}
	local i = 1
	while i < l + 1 do
		table.insert(t, i)
		i = i + 1
	end
	return t
end

basic.remove_value = function(tbl, x)
	for i, v in pairs(tbl) do
		if v == x then
			tbl[i] = nil
		end
	end
end
return basic
