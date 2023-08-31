const std = @import("std");

fn swap(comptime T: type, elements: []T, i: usize, j: usize) void {
    const x = elements[i];
    const y = elements[j];
    elements[i] = y;
    elements[j] = x;
}
fn partition(comptime T: type, elements: []T, low: usize, high: usize) usize {
    const pivot = high;
    var i = low;
    var j = low;
    while (j < high) : (j += 1) {
        if (elements[j] < elements[pivot]) {
            swap(T, elements, j, i);
            i += 1;
        }
    }
    swap(T, elements, i, high);
    return i;
}
fn qsort(comptime T: type, elements: []T, low: usize, high: usize) void {
    if (low > high) {
        return;
    }
    const p = partition(T, elements, low, high);
    if (p < 1) {
        return;
    }
    qsort(T, elements, low, p - 1);
    qsort(T, elements, p + 1, high);
}

pub fn quick(comptime T: type, elements: []T) void {
    qsort(T, elements, 0, elements.len - 1);
}

const expect = std.testing.expect;
test "quick sort" {
    var testInts = [_]u32{ 3, 1, 3, 5, 1, 1, 2, 6 };
    quick(u32, &testInts);
    try expect(testInts[0] == 1);
    try expect(testInts[6] == 5);
    try expect(testInts[7] == 6);
    for (testInts) |num| {
        std.debug.print("Value: {d}\n", .{num});
    }
}
