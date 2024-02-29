// learn zig:
// 1. https://ziglang.org/documentation/0.11.0
// 2. https://zig.guide/
const std = @import("std");
const printf = std.debug.print;

test "hello_world" {
    printf("Hello, {s}!\n", .{"World"});
}

// value assignment - (const|var) identifier[: type] = value
test "assignment" {
    // ================================================================================
    // {const} indicate that indentifer stores an immutable value
    const a: i8 = 10;
    printf("{d}", .{a});
    // so what happen when we try to reassign a value to a const variable?
    // like:
    //      a = 20;
    //      printf("{}", .{a});
    // it will result in a compile-time error:
    // cannot assign to const variable 'a'
    // ================================================================================

    // ================================================================================
    // {var} indicate that identifer stores an mutable value
    var b: u8 = 20;
    printf("{d}", .{b});
    b = 30;
    printf("{d}", .{b});
    // so we can reassign a value to a var variable without any problem
    // and it will print 20 and 30 respectively to the console as expected
    // ================================================================================

    // ================================================================================
    // {: type} is a type annotation for identifier (optional),
    //      can be omitted if the data type of value can be inferred
    var c: u32 = undefined;
    printf("{d}", .{c});
    // ================================================================================
}
