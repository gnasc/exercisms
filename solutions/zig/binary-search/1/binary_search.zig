// Take a look at the tests, you might have to change the function arguments

pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    if(items.len < 1) return null;
    if(items[0] > target) return null;
    if(items[items.len - 1] < target) return null;
    
    const mid: usize = switch(items.len % 2) {
        0 => items.len / 2,
        else => if(items.len == 1) items.len - 1 else items.len / 2,
    };
    
    if(items[mid] == target) return mid;

    if(binarySearch(T, target, items[0..mid])) |start| {
        return start;
    } else if(binarySearch(T, target, items[mid..items.len])) |end| {
        return mid + end;
    }

    return null;
}
