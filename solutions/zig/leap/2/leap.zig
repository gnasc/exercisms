pub fn isLeapYear(year: u32) bool {   
    if ((year % 100 == 0 and year % 400 == 0) or (year % 4 == 0 and year % 100 != 0)) {
        return true;
    }
    
    return false;
}
