const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna: []u8 = try allocator.alloc(u8, dna.len);
    var char: u8 = undefined;

    for (dna, 0..) |n, i| {
        char = switch (n) {
            'G' => 'C',
            'C' => 'G',
            'T' => 'A',
            'A' => 'U',
            else => continue,
        };

        rna[i] = char;
    }

    return rna;
}
