pub fn eggCount(number: usize) usize {
    var count: usize = 0;
    var num: usize = number;

    while (num > 0){
        if (num & 1 == 1) count += 1;
        num = num >> 1;
    }

    return count;
}
