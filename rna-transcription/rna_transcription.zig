const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var result = try allocator.alloc(u8, dna.len);

    for (0.., dna) |i, v| {
        const c: u8 = switch (v) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => 0,
        };
        result[i] = c;
    }

    return result;
}
