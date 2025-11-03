const std = @import("std");

/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    var writer = std.io.Writer.fixed(buffer);

    if (s.len > 0) {
        var i: usize = s.len - 1;

        while (i >= 0) : (i -= 1) {
            writer.print("{c}", .{ s[i] }) catch unreachable;

            if (i == 0) break;
        }
    }

    return writer.buffered();
}
