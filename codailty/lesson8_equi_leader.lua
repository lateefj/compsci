--[[
A non-empty array A consisting of N integers is given.

The leader of this array is the value that occurs in more than half of the elements of A.

An equi leader is an index S such that 0 ≤ S < N − 1 and two sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N − 1] have leaders of the same value.

For example, given array A such that:

    A[0] = 4
    A[1] = 3
    A[2] = 4
    A[3] = 4
    A[4] = 4
    A[5] = 2
we can find two equi leaders:

0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.
The goal is to count the number of equi leaders.

Write a function:

function solution(A)

that, given a non-empty array A consisting of N integers, returns the number of equi leaders.

For example, given:

    A[0] = 4
    A[1] = 3
    A[2] = 4
    A[3] = 4
    A[4] = 4
    A[5] = 2
the function should return 2, as explained above.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]

local basic = require("basic")

local function solution(a)
	local count = {}
	for i, v in pairs(a) do
		if count[v] == nil then
			count[v] = 1
		else
			count[v] = count[v] + 1
		end
	end
	local max = nil
	local min = nil
	for _, v in pairs(count) do
		if max == nil then
			max = v
			min = v
		end
		if v > max then
			max = v
		end
		if v < min then
			min = v
		end
	end
	if max / (min + 1) > 1 then
		return max / (min + 1)
	else
		return 1
	end
end

A = { [0] = 4, [1] = 3, [2] = 4, [3] = 4, [4] = 4, [5] = 2 }
assert(solution(A) == 2)
