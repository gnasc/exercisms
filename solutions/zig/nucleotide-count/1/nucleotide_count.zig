const ascii = @import("std").ascii;

pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var n_counts = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };
    
    for (s) |c| {
        switch (ascii.toLower(c)) {
            'a' => n_counts.a += 1,
            'c' => n_counts.c += 1,
            'g' => n_counts.g += 1,
            't' => n_counts.t += 1,
            else => return NucleotideError.Invalid,
        }
    }

    return n_counts;
}
