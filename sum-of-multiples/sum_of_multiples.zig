const std = @import("std");
const mem = std.mem;

fn findMultiples(map: *std.AutoHashMap(u64, void), factor: u32, limit: u32) !void {
    if (factor == 0) return;

    var mult: u64 = factor;
    var i: u32 = 1;
    while (mult < limit) : (i += 1) {
        try map.put(mult, {});

        mult = factor * i;
    }
}

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var map = std.AutoHashMap(u64, void).init(allocator);
    defer map.deinit();

    for (factors) |factor| {
        try findMultiples(&map, factor, limit);
    }

    var iter = map.iterator();
    var res: u64 = 0;
    while (iter.next()) |val| {
        res += val.key_ptr.*;
    }

    return res;
}
