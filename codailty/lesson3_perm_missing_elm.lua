--[[
An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

function solution(A)

that, given an array A, returns the value of the missing element.

For example, given array A such that:

  A[0] = 2
  A[1] = 3
  A[2] = 1
  A[3] = 5
the function should return 4, as it is the missing element.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
the elements of A are all distinct;
each element of array A is an integer within the range [1..(N + 1)].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]

A = { [0] = 2, [1] = 3, [2] = 1, [3] = 5 }

-- This implementation works for small size A as it is fast however doubles the memory usage
-- For large A it would be much better to sort the list first as it would not double the memory footprint
local function find_missing(t)
	local i = 1
	local c = {}
	while i <= #t + 2 do
		c[i] = i
		i = i + 1
	end
	for _, v in pairs(t) do
		c[v] = nil
	end
	local _, v = next(c)
	return v
end

assert(find_missing(A) == 4)
