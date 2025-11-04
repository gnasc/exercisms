const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    var energy: u64 = 0;
    
    var points = std.AutoHashMap(u64, void).init(allocator);
    defer points.deinit();

    base: for (factors) |f| {
        for (1..limit) |i| {
            if (f * i >= limit) continue :base;
        
            try points.put(@as(u64, f * i), {});
        }
    }

    // keyIterator instead of iterator
    var iterator = points.keyIterator();
    while (iterator.next()) |value| {
        energy += value.*;
    }


    return energy;
}
