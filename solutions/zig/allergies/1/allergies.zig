const std = @import("std");
const EnumSet = std.EnumSet;
const AllergenSet = EnumSet(Allergen);

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    var set = initAllergenSet(score);

    return set.contains(allergen);
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var set = AllergenSet.initEmpty();
    for (0..8) |bit| {
        const value: u8 = @as(u8, 1) << @intCast(bit);
        
        if (value & score != 0) {
            set.insert(@enumFromInt(bit));
        }
    }

    return set;
}
