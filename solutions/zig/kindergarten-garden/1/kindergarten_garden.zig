const std = @import("std");

pub const Plant = enum {
    clover,
    grass,
    radishes,
    violets,
};

const Name = enum(u8){
    alice, 
    bob, 
    charlie, 
    david, 
    eve, 
    fred, 
    ginny, 
    harriet, 
    ileana, 
    joseph, 
    kincaid,
    larry,
};

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var buffer: [32]u8 = undefined;
    const lower_student = std.ascii.lowerString(&buffer, student);
    
    const name: Name = std.meta.stringToEnum(Name, lower_student).?;
    const name_int = @intFromEnum(name) * 2;
    const line_len = (@as(u8, @intCast(diagram.len)) / 2) + 1;
    const pos: [4]u8 = .{ (name_int), (name_int + 1), (name_int + line_len), (name_int + line_len + 1) }; 

    var result: [4]Plant = undefined; 

    for(pos, 0..) |p, i| {        
        const plant: Plant = switch(diagram[p]) {
            'G' => .grass,
            'C' => .clover,
            'R' => .radishes,
            'V' => .violets,
            else => unreachable,
        };

        result[i] = plant;
    }

    return result;
}
