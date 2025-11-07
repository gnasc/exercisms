const std = @import("std");
    
pub const ChessboardError = error{ IndexOutOfBounds };

pub fn square(index: usize) ChessboardError!u64 {
    switch(index) {
        1...64 => return std.math.pow(u64, 2, index - 1),
        else => return ChessboardError.IndexOutOfBounds,
    }
}

pub fn total() u64 {
    return @as(u64, @intCast(std.math.pow(u65, 2, 64) -  1));
}
