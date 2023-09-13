--[[
An array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elementsij of A.

For example, consider array A such that

 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.

Write a function

function solution(A)

that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.

For example, given array A such that

 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
the function may return 0, 2, 4, 6 or 7, as explained above.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]

local basic = require("basic")

local function solution(a)
	local idx = {}
	local count = {}
	local mi = nil
	for i, v in pairs(a) do
		if idx[v] == nil then
			idx[v] = { i }
			count[v] = 1
		else
			table.insert(idx[v], i)
			count[v] = count[v] + 1
			if count[v] > (basic.len(a) / 2) then
				mi = v
			end
		end
	end
	return idx[mi]
end

A = { [0] = 3, [1] = 4, [2] = 3, [3] = 2, [4] = 3, [5] = -1, [6] = 3, [7] = 3 }

assert(table.concat(solution(A)) == table.concat({ 0, 2, 4, 6, 7 }))
