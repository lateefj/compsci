--[[
A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

Write a function:

function solution(N)

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..2,147,483,647].

--]]

local math = require("math")

local function bits(num)
	local t = {}
	while num > 0 do
		local rest = math.floor(math.fmod(num, 2))
		t[#t + 1] = rest
		num = (num - rest) / 2
	end
	return table.concat(t)
end

local function solution(N)
	local b = bits(N)
	local max_gap = 0
	local current_gap = 0
	for v in b:gmatch(".") do
		if v == "0" then
			current_gap = current_gap + 1
		else
			if current_gap > max_gap then
				max_gap = current_gap
			end
			current_gap = 0
		end
	end
	return max_gap
end

assert(solution(9) == 2)
assert(solution(5) == 1)
assert(solution(529) == 4)
assert(solution(1041) == 5, "expected 3 however got " .. solution(1041))
