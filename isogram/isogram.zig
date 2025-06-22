const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var set = std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |char| {
        if (char == '-' or char == ' ') {
            continue;
        }

        const setIndex = std.ascii.toLower(char) - 'a';

        if (set.isSet(setIndex)) {
            return false;
        }

        set.set(setIndex);
    }

    return true;
}
