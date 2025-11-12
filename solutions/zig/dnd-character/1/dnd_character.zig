const std = @import("std");

pub fn modifier(score: i8) i8 {
    return @divFloor((score - 10), 2);
}

pub fn ability() i8 {
    var sum: i8 = 0;
    var min: i8 = 6;
    
    for(0..4) |_| {
        const roll = diceRoll() catch unreachable;
        sum += roll;
        
        if(min > roll) min = roll;
    }

    return sum - min;
}

fn diceRoll() !i8 {
    var seed: u64 = undefined;
    try std.posix.getrandom(std.mem.asBytes(&seed));
    var prng = std.Random.DefaultPrng.init(seed);
    const random = prng.random();

    return random.intRangeAtMost(i8, 1, 6);
}

pub const Character = struct { 
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        var character = Character{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = ability(),
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 0,
        };

        character.hitpoints = 10 + modifier(character.constitution);
    
        return character;
    }
};
