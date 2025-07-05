const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acr = std.ArrayList(u8).init(allocator);

    var inWord = false;
    for (words) |char| {
        switch (char) {
            'A'...'Z', 'a'...'z' => {
                if (!inWord) try acr.append(std.ascii.toUpper(char));
                inWord = true;
            },
            ' ', '-' => inWord = false,
            else => continue,
        }
    }

    return acr.toOwnedSlice();
}
