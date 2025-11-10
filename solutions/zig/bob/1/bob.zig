const std = @import("std");
const ascii = std.ascii;

const Resp = enum {
    question,
    yell,
    silence,
};

const RespSet = std.enums.EnumSet(Resp);

pub fn response(s: []const u8) []const u8 {
    var r = RespSet.initFull();
    var has_letter: bool = false;
    var last_char: u8 = undefined;

    for(s) |c| {
        if(ascii.isAlphabetic(c)){
            has_letter = true;
            if (ascii.isLower(c)) r.remove(.yell);
        }

        if(!ascii.isWhitespace(c)){
            r.remove(.silence);
            last_char = c;
        }
    }

    if(!has_letter) r.remove(.yell);
    if(last_char != '?') r.remove(.question);

    if(r.contains(.yell) and r.contains(.question)) return "Calm down, I know what I'm doing!";
    if(r.contains(.yell)) return "Whoa, chill out!";
    if(r.contains(.question)) return "Sure.";
    if(r.contains(.silence)) return "Fine. Be that way!";

    return "Whatever.";
}
