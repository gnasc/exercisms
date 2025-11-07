pub fn squareOfSum(number: usize) usize {
    const num: f32 = @as(f32, @floatFromInt(number));
    // sum = (n + 1) * (n / 2)
    const sum: usize = @as(usize, @intFromFloat((num + 1) * (num / 2)));

    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    const num: f32 = @as(f32, @floatFromInt(number));
    // sum = (n * (n + 1) * (2 * n + 1)) / 6
    const sum: usize = @as(usize, @intFromFloat((num * (num + 1) * (2 * num + 1)) / 6));

    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
