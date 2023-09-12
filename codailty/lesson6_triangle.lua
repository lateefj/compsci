--[[
An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:

A[P] + A[Q] > A[R],
A[Q] + A[R] > A[P],
A[R] + A[P] > A[Q].
For example, consider array A such that:

  A[0] = 10    A[1] = 2    A[2] = 5
  A[3] = 1     A[4] = 8    A[5] = 20
Triplet (0, 2, 4) is triangular.

Write a function:

function solution(A)

that, given an array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.

For example, given array A such that:

  A[0] = 10    A[1] = 2    A[2] = 5
  A[3] = 1     A[4] = 8    A[5] = 20
the function should return 1, as explained above. Given array A such that:

  A[0] = 10    A[1] = 50    A[2] = 5
  A[3] = 1
the function should return 0.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
Note: All arrays in this task are zero-indexed, unlike the common Lua convention. You can use #A to get the length of the array A.
--]]

local basic = require("basic")

local function solution(a)
	for i, x in pairs(a) do
		if i > basic.len(a) - 2 then
			break
		end
		for j = i + 1, basic.len(a), 1 do
			for k = j + 1, basic.len(a), 1 do
				local y = a[j]
				local z = a[k]
				if (x + y) > z and (y + z) > x and (z + x) > y then
					return 1
				end
			end
		end
	end
	return 0
end

assert(solution({ [0] = 10, [1] = 2, [2] = 5, [3] = 1, [4] = 8, [5] = 20 }) == 1)
assert(solution({ [0] = 10, [1] = 50, [2] = 5, [3] = 1 }) == 0)
