const std = @import("std");
const mem = std.mem;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var anagrams = std.BufSet.init(allocator);
    errdefer anagrams.deinit();

    for(candidates) |c| {
        if(c.len != word.len) continue;

        const temp_word = try std.ascii.allocLowerString(allocator, word);
        defer allocator.free(temp_word);
        
        const temp_candidate = try std.ascii.allocLowerString(allocator, c);
        defer allocator.free(temp_candidate);

        if(mem.eql(u8, temp_candidate, temp_word)) continue;

        mem.sort(u8, temp_word, {}, std.sort.asc(u8));
        mem.sort(u8, temp_candidate, {}, std.sort.asc(u8));

        if(mem.eql(u8, temp_candidate, temp_word)) {
            try anagrams.insert(c);
        }
    }
    

    return anagrams;
}
