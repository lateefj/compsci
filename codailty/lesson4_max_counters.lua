--[[
You are given N counters, initially set to 0, and you have two possible operations on them:

increase(X) − counter X is increased by 1,
max counter − all counters are set to the maximum value of any counter.
A non-empty array A of M integers is given. This array represents consecutive operations:

if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
if A[K] = N + 1 then operation K is max counter.
For example, given integer N = 5 and array A such that:

    A[0] = 3
    A[1] = 4
    A[2] = 4
    A[3] = 6
    A[4] = 1
    A[5] = 4
    A[6] = 4
the values of the counters after each consecutive operation will be:

    (0, 0, 1, 0, 0)
    (0, 0, 1, 1, 0)
    (0, 0, 1, 2, 0)
    (2, 2, 2, 2, 2)
    (3, 2, 2, 2, 2)
    (3, 2, 2, 3, 2)
    (3, 2, 2, 4, 2)
The goal is to calculate the value of every counter after all operations.

Write a function:

function solution(N, A)

that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of integers representing the values of the counters.

Result array should be returned as an array of integers.

For example, given:

    A[0] = 3
    A[1] = 4
    A[2] = 4
    A[3] = 6
    A[4] = 1
    A[5] = 4
    A[6] = 4
the function should return [3, 2, 2, 4, 2], as explained above.

Write an efficient algorithm for the following assumptions:

N and M are integers within the range [1..100,000];
each element of array A is an integer within the range [1..N + 1].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]

local basic = require("basic")

local function max_counters(tbl, n)
	local inc = {}
	while basic.len(inc) < n do
		table.insert(inc, 0)
	end
	for _, v in pairs(tbl) do
		if v > basic.len(inc) then
			local m = basic.max(inc)
			for j, _ in pairs(inc) do
				inc[j] = m
			end
		else
			inc[v] = inc[v] + 1
		end
	end
	return inc
end

A = { [0] = 3, [1] = 4, [2] = 4, [3] = 6, [4] = 1, [5] = 4, [6] = 4 }

assert(table.concat(max_counters(A, 5)) == table.concat({ 3, 2, 2, 4, 2 }))
