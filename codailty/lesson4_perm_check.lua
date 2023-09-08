--[[
A non-empty array A consisting of N integers is given.

A permutation is a sequence containing each element from 1 to N once, and only once.

For example, array A such that:

    A[0] = 4
    A[1] = 1
    A[2] = 3
    A[3] = 2
is a permutation, but array A such that:

    A[0] = 4
    A[1] = 1
    A[2] = 3
is not a permutation, because value 2 is missing.

The goal is to check whether array A is a permutation.

Write a function:

function solution(A)

that, given an array A, returns 1 if array A is a permutation and 0 if it is not.

For example, given array A such that:

    A[0] = 4
    A[1] = 1
    A[2] = 3
    A[3] = 2
the function should return 1.

Given array A such that:

    A[0] = 4
    A[1] = 1
    A[2] = 3
the function should return 0.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [1..1,000,000,000].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]
local basic = require("basic")

local function is_permutation(tbl)
	local gt = basic.generate_table(basic.len(tbl))
	for _, v in pairs(tbl) do
		basic.remove_value(gt, v)
	end
	if basic.len(gt) == 0 then
		return 1
	end
	return 0
end

A = { [0] = 4, [1] = 1, [2] = 3, [3] = 2 }
assert(is_permutation(A) == 1)
B = { [0] = 4, [1] = 1, [2] = 3 }
assert(is_permutation(B) == 0)
