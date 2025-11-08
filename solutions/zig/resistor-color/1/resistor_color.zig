pub const ColorBand = enum(u4) {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

pub fn colors() []const ColorBand {
    const color_list: []const ColorBand = &.{
        .black, .brown, .red, .orange, .yellow, .green, .blue, .violet, .grey, .white,
    };

    return color_list;
}
