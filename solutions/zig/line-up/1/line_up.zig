const std = @import("std");
const mem = std.mem;

pub fn format(allocator: mem.Allocator, name: []const u8, number: u10) ![]u8 {
    const tens = number % 100;
    const ones = tens % 10;
    const fmt = "{s}, you are the {d}{s} customer we serve today. Thank you!";

    const ordinal = switch(ones) {
        1 => if(tens != 11) "st" else "th",
        2 => if(tens != 12) "nd" else "th",
        3 => if(tens != 13) "rd" else "th",
        else => "th"      
    };
    
    return std.fmt.allocPrint(allocator, fmt, .{name, number, ordinal});
}
