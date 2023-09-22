local basic = require("basic")

local ds = {}

ds.stack = function()
	local s = {}
	s._data = {}
	function s:push(v)
		if v ~= nil then
			table.insert(s._data, v)
		end
	end

	function s:pop()
		local v = s._data[1]
		table.remove(s._data, 1)
		return v
	end

	function s:len()
		return #s._data
	end

	return s
end

ds.queue = function()
	local q = {}
	q._data = {}
	q._first = nil
	q._last = 0
	function q:en(v)
		if v ~= nil then
			q._last = q._last + 1
			if q._first == nil then
				q._first = q._last
			end
			q._data[q._last] = v
		end
	end

	function q:de()
		if q._first == nil then
			return nil
		end
		local v = q._data[q._first]
		q._data[q._first] = nil
		-- If at the end of the line
		if q._first == q._last then
			q._first = nil
		else
			q._first = q._first + 1
		end
		return v
	end

	function q:len()
		return basic.len(q._data)
	end

	return q
end

return ds
