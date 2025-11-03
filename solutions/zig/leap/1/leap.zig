pub fn isLeapYear(year: u32) bool {
    const mod_4: bool = @mod(year, 4) == 0;
    const mod_100: bool = @mod(year, 100) == 0;
    const mod_400: bool = @mod(year, 400) == 0;
    
    if ((mod_100 and mod_400) or (mod_4 and !mod_100)) return true;
    
    return false;
}
