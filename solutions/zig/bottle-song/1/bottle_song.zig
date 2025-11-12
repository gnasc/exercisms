const std = @import("std");

const Number = enum {
    zero, one, two, three, four, five, six, seven, eight, nine, ten,
};

const number_map = std.EnumMap(Number, []const u8).init(.{
    .zero = "No", 
    .one = "One",
    .two = "Two", 
    .three = "Three",
    .four = "Four",
    .five = "Five",
    .six = "Six", 
    .seven = "Seven",
    .eight = "Eight",
    .nine = "Nine",
    .ten = "Ten",
});

const fmt_song = 
    \\{s} green {s} hanging on the wall,
    \\{s} green {s} hanging on the wall,
    \\And if one green bottle should accidentally fall,
    \\There'll be {s} green {s} hanging on the wall.
    ;

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) ![]const u8 {
    var writer = std.Io.Writer.fixed(buffer);
    var bottle_current: u32 = start_bottles;
    var bottle_next: u32 = undefined; 
    
    for(0..take_down) |i| {
        bottle_next = @intCast(bottle_current - @as(u32, 1));

        const text_current: []const u8 = if(bottle_current != 1) "bottles" else "bottle";
        const text_next: []const u8 = if(bottle_next != 1) "bottles" else "bottle";

        const start_bottles_enum: Number = @enumFromInt(bottle_current);
        const next_bottles_enum: Number = @enumFromInt(bottle_next);

        const current_str = number_map.get(start_bottles_enum).?;
        const next_str = number_map.get(next_bottles_enum).?;

        var lower_buf: [6]u8 = undefined;
        const next_str_lower = std.ascii.lowerString(&lower_buf, next_str);

        const args = .{ current_str, text_current } ** 2 ++ .{ next_str_lower, text_next};

        if(i != 0) try writer.print("\n\n", .{});
        try writer.print(fmt_song, args);

        bottle_current = bottle_next;
    }

    return writer.buffered();
}

