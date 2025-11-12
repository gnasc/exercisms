const std = @import("std");

pub fn isValidIsbn10(s: []const u8) bool {
    if(s.len < 10 or s.len > 13) return false;

    var num: u8 = 10;
    var count: u8 = 0;    
    var sum: u16 = 0;

    for(s, 0..) |d, i| {
        if(count >= 10) return false;
        
        const isDigit: bool = std.ascii.isDigit(d);
        const isDash: bool = (d == '-');
        const isCheck: bool = (d == 'X' and i == s.len - 1);

        if(isDigit or isDash or isCheck) {
            var digit: u8 = undefined;
            
            if(isDash) continue;
            if(isCheck) digit = 10;
            
            if(isDigit) {
                const arr_d: [1]u8 =  .{d};
                digit = std.fmt.parseInt(u8, arr_d[0..], 10) catch unreachable;  
            } 

            sum += @intCast(digit * num);
            num -= 1;
            count += 1;
        } else {
            return false;
        }
    }

    return @mod(sum, 11) == 0;
}
