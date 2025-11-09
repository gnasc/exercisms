const std = @import("std");
const mem = std.mem;

pub const ColorBand = enum(usize) {
    black, brown, red, orange, yellow, green, blue, violet, grey, white,
};

pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    const zeros: usize = @intFromEnum(colors[2]);
    const value: usize = (@intFromEnum(colors[0]) * 10 + @intFromEnum(colors[1])) * std.math.pow(usize, 10, zeros);

    const result = switch(zeros) {
        0...1 => .{ "ohms", value, @as(usize, 0)},
        2...4 => .{ "kiloohms", value / 1_000, (value % 1_000) / 100},
        5...7 => .{ "megaohms", value / 1_000_000, (value % 1_000_000) / 100_000},
        8...10 => .{ "gigaohms", value / 1_000_000_000, (value % 1_000_000_000) / 100_000_000},
        else => unreachable,
    };

    if (result.@"2" == 0) {
        return try std.fmt.allocPrint(allocator, "{d} {s}", .{ result.@"1", result.@"0" });
    }

    return try std.fmt.allocPrint(allocator, "{d}.{d} {s}", .{ result.@"1", result.@"2", result.@"0" });
}
