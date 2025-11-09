pub fn squareRoot(radicand: usize) usize {
    if (radicand == 0) return 0;
    
    var prev2: usize = 0;
    var prev1: usize = 1;
    var next: usize = 0;

    while(true) {
        next = (prev1 + (radicand / prev1)) / 2;

        if(next == prev1) return next;

        if(next == prev2 and next != prev1) return if (next < prev1) next else prev1;

        prev2 = prev1;
        prev1 = next;
    }
}
