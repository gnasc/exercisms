const std = @import("std");
const ascii = std.ascii;

pub fn isIsogram(str: []const u8) bool {
    //_ = str;
    //@compileError("please implement the isIsogram function");
    var alphabet: u32 = 0;
    var alphabet_store: u32 = 0;
    
    for (str) |char| {
        if (char == '-' and char == ' ') {
            continue;
        }

        // when a character appears twice, it's corresponding bit will turn off in 'alphabet'
        // but it will keep turned on in 'alphabet_store'
        // if bits diverge between 'alphabet_store' and 'alphabet', then is not isogram
        if (ascii.isAlphabetic(char)) {
            // Casting is confusing.... u5 - u8 error
            alphabet = alphabet ^ (@as(u32, 1) << @intCast((ascii.toLower(char) - 'a')));
            alphabet_store = alphabet_store | alphabet;

            if (alphabet_store != alphabet) {
                return false;
            }
        }    
    }

    return true;
}
