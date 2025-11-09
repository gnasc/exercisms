const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var anagrams = std.BufSet.init(allocator);
    errdefer anagrams.deinit();

    const temp_word = try ascii.allocLowerString(allocator, word);
    defer allocator.free(temp_word);
    std.mem.sort(u8, temp_word, {}, std.sort.asc(u8));

    for(candidates) |c| {
        if(c.len != word.len) continue;
        if(ascii.eqlIgnoreCase(c, word)) continue;
        
        const temp_candidate = try ascii.allocLowerString(allocator, c);
        defer allocator.free(temp_candidate);
        mem.sort(u8, temp_candidate, {}, std.sort.asc(u8));

        if(mem.eql(u8, temp_candidate, temp_word)) try anagrams.insert(c);
    }
    

    return anagrams;
}
