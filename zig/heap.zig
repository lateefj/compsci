const std = @import("std");

pub fn Heap(comptime T: type) type {
    return struct {
        const This = @This();
        elements: []T,
        alloc: std.mem.Allocator,
        pub fn init(alloc: std.mem.Allocator, items: []T) This {
            return This{
                .alloc = alloc,
                .elements = items,
            };
        }
        pub fn len(this: *This) usize {
            return this.elements.len;
        }
        pub fn less(this: *This, i: usize, j: usize) bool {
            return this.elements[i] < this.elements[j];
        }
        pub fn swap(this: *This, i: usize, j: usize) void {
            const left = this.elements[i];
            const right = this.elements[j];
            this.elements[i] = left;
            this.elements[j] = right;
        }
        pub fn pop(this: *This) T {
            const x = this.elements[this.elements.len - 1];
            this.elements = this.elements[0..(this.elements.len - 2)];
            return x;
        }
        pub fn push(this: *This, x: T) void {
            var tmp = std.ArrayList(T).initCapacity(this.alloc, this.elements.len + 1);
            tmp.appendSlice(this.elements);
            tmp.append(x);
            this.alloc.free(this.elements);
            this.elements = tmp;
        }
        pub fn get(this: *This, i: usize) T {
            return this.elements[i];
        }
    };
}

const test_allocator = std.testing.allocator;
const expect = std.testing.expect;

test "heap" {
    var testInts = [_]u32{ 3, 1, 3, 5, 1, 1, 2, 6 };
    var h = Heap(u32).init(test_allocator, &testInts);
    try expect(h.len() == 8);
    var idx: usize = 0;
    for (testInts) |num| {
        try expect(h.get(idx) == num);
        idx += 1;
    }
    try expect(h.pop() == 6);
    try expect(h.pop() == 5);
}
