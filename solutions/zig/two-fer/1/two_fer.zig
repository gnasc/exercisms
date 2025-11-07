const std = @import("std");

pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const person = name orelse "you";
    
    var writer = std.Io.Writer.fixed(buffer);
    try writer.print("One for {s}, one for me.", .{ person });

    return writer.buffered();
}
