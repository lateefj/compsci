--[[
This is a demo task.

Write a function:

function solution(A)

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [−1,000,000..1,000,000].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]
local basic = require("basic")

local function find_smallest(tbl)
	local i = 1
	local m = basic.max(tbl)
	local missing = {}
	while i <= m do
		table.insert(missing, i)
		i = i + 1
	end
	for _, v in pairs(tbl) do
		basic.remove_value(missing, v)
	end

	if #missing > 1 then
		return table.remove(missing)
	end
	return 1
end

assert(find_smallest({ 1, 3, 6, 4, 1, 2 }) == 5)
assert(find_smallest({ 1, 2, 3 }) == 1)
assert(find_smallest({ -1, -3 }) == 1)
