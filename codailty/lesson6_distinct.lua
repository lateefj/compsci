--[[
Write a function

function solution(A)

that, given an array A consisting of N integers, returns the number of distinct values in array A.

For example, given array A consisting of six elements such that:

 A[0] = 2    A[1] = 1    A[2] = 1
 A[3] = 2    A[4] = 3    A[5] = 1
the function should return 3, because there are 3 distinct values appearing in array A, namely 1, 2 and 3.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
each element of array A is an integer within the range [−1,000,000..1,000,000].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]

local basic = require("basic")

local function solution(a)
	local tmp = {}
	for _, v in pairs(a) do
		tmp[v] = true
	end
	return basic.len(tmp)
end

A = { [0] = 2, [1] = 1, [2] = 1, [3] = 2, [4] = 3, [5] = 1 }

assert(solution(A) == 3)
