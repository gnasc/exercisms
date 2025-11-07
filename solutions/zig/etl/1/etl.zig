const std = @import("std");
const mem = std.mem;

pub fn transform(allocator: mem.Allocator, legacy: std.AutoHashMap(i5, []const u8)) mem.Allocator.Error!std.AutoHashMap(u8, i5) {
    var scores = std.AutoHashMap(u8, i5).init(allocator);
    var legacy_iter = legacy.iterator();

    while(legacy_iter.next()) |entry| {
        for(entry.value_ptr.*) |letter| {
            try scores.put(std.ascii.toLower(letter), entry.key_ptr.*);
        }
    }

    return scores;
}
