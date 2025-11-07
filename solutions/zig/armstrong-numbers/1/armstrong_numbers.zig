const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    var result: u128 = 0;
    var buffer: [39]u8 = undefined;
    
    var writer = std.Io.Writer.fixed(&buffer);
    writer.print("{d}", .{ num }) catch unreachable;

    for (writer.buffered()) |digit| {
        result += std.math.powi(u128, digit - '0', writer.buffered().len) catch unreachable;
    }

    return result == num;
}
