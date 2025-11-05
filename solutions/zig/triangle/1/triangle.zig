pub const TriangleError = error { Invalid };

pub const Triangle = struct {
    a: f64,
    b: f64,
    c: f64,
    
    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        const valid_length: bool = (a > 0) and (b > 0) and (c > 0);
        const valid_triangle: bool = (a + b >= c) and (a + c >= b) and (b + c >= a);
    
        if (valid_length and valid_triangle) {
            return Triangle{ .a = a, .b = b, .c = c};
        } 

        return TriangleError.Invalid;
    }

    pub fn isEquilateral(self: Triangle) bool {
        return (self.a == self.b) and (self.b == self.c);
    }

    pub fn isIsosceles(self: Triangle) bool {
        return ((self.a == self.b and self.a != self.c) or 
                (self.a == self.c and self.a != self.b) or 
                (self.b == self.c and self.b != self.a));
    }

    pub fn isScalene(self: Triangle) bool {
        return (self.a != self.b) and (self.a != self.c) and (self.b != self.c);
    }
};
