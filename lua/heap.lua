local sort = require("sort")

Heap = { elements = {} }
Heap.__index = Heap

function Heap:new(elements)
	local hp = {}
	setmetatable(hp, Heap)
	hp.elements = elements
	sort.quick(hp)
	return hp
end

function Heap:len()
	return #self.elements
end

function Heap:less(i, j)
	return self.elements[i] < self.elements[j]
end

function Heap:swap(i, j)
	local x = self.elements[i]
	local y = self.elements[j]
	self.elements[i] = y
	self.elements[j] = x
end

function Heap:push(x)
	table.insert(self.elements, x)
end

function Heap:pop()
	return table.remove(self.elements, #self.elements)
end

function Heap:get(i)
	return self.elements[i]
end

local string = require("string")
local nums = { 3, 1, 3, 5, 1, 1, 2, 6 }

local h = Heap:new(nums)
local last = h:pop()
assert(last == 6, string.format("expected 6, got %d", last))
local function print_table(tbl)
	for k, v in pairs(tbl) do
		print(k, v)
	end
end
local sh = Heap:new({ 3, 1, 3, 5, 1, 1, 2, 6 })
assert(sh:get(1) == 1, string.format("expected first element to be 1 but was %d", sh:get(1)))
assert(sh:get(7) == 5, string.format("expected 7 element to be 5 but was %d", sh:get(7)))
print("Raw un sorted")
print("Sorted")
print_table(sh.elements)
assert(sh:get(1) == 1, string.format("expected first element to be 1 but was %d", sh:get(1)))
assert(sh:get(7) == 5, string.format("expected 7 element to be 5 but was %d", sh:get(7)))
