const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var bufStream = std.io.fixedBufferStream(buffer);
    const writer = bufStream.writer();

    if (n % 3 == 0) {
        _ = writer.write("Pling") catch unreachable;
    }
    if (n % 5 == 0) {
        _ = writer.write("Plang") catch unreachable;
    }
    if (n % 7 == 0) {
        _ = writer.write("Plong") catch unreachable;
    }
    if (n % 3 != 0 and n % 5 != 0 and n % 7 != 0) {
        _ = std.fmt.formatInt(n, 10, std.fmt.Case.lower, .{}, writer) catch unreachable;
    }

    return buffer[0..bufStream.pos];
}
