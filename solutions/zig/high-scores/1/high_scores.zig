const std = @import("std");

pub const HighScores = struct {
    scores: []const i32,
    
    pub fn init(scores: []const i32) HighScores {
        return HighScores{ .scores = scores };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self.scores.len < 1) return null;

        return self.scores[self.scores.len - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        if (self.scores.len < 1) return null;

        var best: i32 = undefined;

        for (self.scores) |s| {
            if (s > best) best = s;
        }

        return best;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        if(self.scores.len < 1) return &.{};
        if(self.scores.len < 2) return self.scores[0..self.scores.len];

        var temp: []i32 = @constCast(self.scores);
        const size: usize = if (self.scores.len < 3) self.scores.len else 3;

        std.mem.sort(i32, temp, {}, comptime std.sort.desc(i32));

        return temp[0..size];
    }
};
