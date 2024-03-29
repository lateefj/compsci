--[[A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:

S is empty;
S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
S has the form "VW" where V and W are properly nested strings.
For example, the string "{[()()]}" is properly nested but "([)()]" is not.

Write a function:

function solution(S)

that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.

For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..200,000];
string S is made only of the following characters: '(', '{', '[', ']', '}' and/or ')'.
--]]

local ds = require("ds")
MATCH = { ["{"] = "}", ["["] = "]", ["("] = ")" }
local function solution(s)
	local st = ds.stack()
	for _, c in pairs(s) do
		if MATCH[c] ~= nil then
			st:push(c)
		else
			local t = st:pop()
			if t == nil or MATCH[t] == nil then
				return 0
			end
		end
	end
	return 1
end
S = { "{", "[", "(", ")", "(", ")", "]", "}" }
F = { "[", "(", ")", ")", "]" }

assert(solution(S) == 1)
assert(solution(F) == 0)
