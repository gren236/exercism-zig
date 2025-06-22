const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var set = std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |char| {
        const cIndex = switch (char) {
            'a'...'z' => char - 'a',
            'A'...'Z' => std.ascii.toLower(char) - 'a',
            else => {
                continue;
            },
        };

        if (set.count() == 26) {
            return true;
        }

        set.set(cIndex);
    }

    if (set.count() == 26) {
        return true;
    }

    return false;
}
