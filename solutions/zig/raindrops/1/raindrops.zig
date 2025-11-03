const std = @import("std");

pub fn convert(buffer: []u8, n: u32) []const u8 {
    var writer = std.io.Writer.fixed(buffer);

    if (n % 3 == 0) writer.print("{s}", .{ "Pling" }) catch unreachable;
    if (n % 5 == 0) writer.print("{s}", .{ "Plang" }) catch unreachable;
    if (n % 7 == 0) writer.print("{s}", .{ "Plong" }) catch unreachable;

    if ((n % 3 != 0) and (n % 5 != 0) and (n % 7 != 0)) {
        writer.print("{d}", .{ n }) catch unreachable;
    }

    return writer.buffered();
}
