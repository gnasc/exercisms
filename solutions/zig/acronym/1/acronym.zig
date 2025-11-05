const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var split = mem.tokenizeAny(u8, words, " ,.-_\n");

    var tokens: std.ArrayList(u8) = .empty;
    defer tokens.deinit(allocator);

    while (split.next()) |word| {
        try tokens.append(allocator, std.ascii.toUpper(word[0]));
    }

    return tokens.toOwnedSlice(allocator);
}
