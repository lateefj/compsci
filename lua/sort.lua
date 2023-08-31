--[[
Sorting package for implementing simple sort algorithms. This depends on a 
data structure that has 4 methods (inspired by Go's Sort interface):
 
* len() - Length of elements
* less(i, j) - Given two indexes is the first less than the second
* swap(i, j) - Swap the elements locations

--]]
local sort = {} -- Sort package

local function partition(sortable, low, high)
	local pivot = high
	for j = low, high do
		if sortable:less(j, pivot) then
			sortable:swap(j, low)
			low = low + 1
		end
	end
	sortable:swap(low, high)
	return low
end
-- Logic behind most q sorts
local function qsort(sortable, low, high)
	if low > high then
		return
	end
	local p = partition(sortable, low, high)
	qsort(sortable, low, p - 1)
	qsort(sortable, p + 1, high)
end

function sort.quick(sortable)
	qsort(sortable, 1, sortable:len())
end
return sort
