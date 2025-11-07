const std = @import("std");

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const distance: f32 = (self.x - 0) * (self.x - 0) + (self.y - 0) * (self.y - 0);

        if (distance <= 1) return 10;
        if (distance <= 5 * 5) return 5;
        if (distance <= 10 * 10) return 1;

        return 0;
    }
};
