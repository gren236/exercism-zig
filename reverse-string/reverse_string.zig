const std = @import("std");

pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var bufStream = std.io.fixedBufferStream(buffer);
    const writer = bufStream.writer();

    var i = s.len;
    while (i > 0) {
        i -= 1;
        writer.writeByte(s[i]) catch unreachable;
    }

    return bufStream.getWritten();
}
