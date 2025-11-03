const ascii = @import("std").ascii;

pub fn isPangram(str: []const u8) bool {
    var alphabet: u32 = 0;

    for (str) |char| {
        if (ascii.isAlphabetic(char)) {
            alphabet = alphabet | (@as(u32, 1) << @intCast(ascii.toLower(char) - 'a'));
        }
    }

    if (alphabet == 0b00000011_11111111_11111111_11111111) {
        return true;
    }

    return false;
}
