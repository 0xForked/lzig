const std = @import("std");
const printf = std.debug.print;
const assert = std.debug.assert;

pub fn main() void {
    // ================================================================================
    const lorem = "Lorem";
    sayHello(lorem);
    // ================================================================================
    const a: u8 = 10;
    printf("{}\n", .{a});
    // ================================================================================
    var b: u8 = undefined;
    printf("{d}\n", .{b});
    // ================================================================================
    const s = struct {
        var x: u8 = 12;
    };
    s.x += 1;
    printf("{}\n", .{@TypeOf(s)});
    printf("{}\n", .{@TypeOf(s.x)});
    printf("{d}\n", .{s.x});
    // ================================================================================
    const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
    printf("{s}\n", .{message});
    printf("msg len {}\n", .{message.len});
    const slice = message[0..3];
    printf("slice {s}\n", .{slice});
    // ================================================================================
    for (message, 0..) |value, index| {
        if (index == 2) {
            printf("=====\n", .{});
        }
        printf("{c}\n", .{value});
        if (index == 2) {
            printf("=====\n", .{});
        }
    }

    var item: u16 = 2;
    defer {
        printf("Defer: {}\n", .{item * 2});
    }
    for (1..10) |_| {
        item *= 2;
    }
    printf("{}\n", .{item});
    // ================================================================================
    var next_index: u16 = 0;
    while (next_index < 10) {
        item /= 2;
        printf("div {}\n", .{item});
        next_index += 1;
    }
    // ================================================================================
    const State = enum {
        Running,
        Stopped,
    };
    // ================================================================================
    const state = State.Running;
    switch (state) {
        State.Running => {
            printf("Running\n", .{});
        },
        State.Stopped => {
            printf("Stopped\n", .{});
        },
    }
    // ================================================================================
    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 5000);
    printf("{}\n", .{inferred_constant});
    printf("{}\n", .{inferred_variable});
    // ================================================================================
    const fib = fibonacci(10);
    printf("fib: {}\n", .{fib});
    // ================================================================================
    const Strt = struct {
        var x: u8 = 12;
        var y: u8 = 10;
    };
    printf("struct: {}\n", .{Strt.x + Strt.y});
    // ================================================================================
    const Un = union {
        int: i64,
        float: f64,
        bool: bool,
    };
    var result = Un{ .int = 1234 };
    // result.float = 12.34; will cause an error
    printf("un: {}\n", .{result.int});
}

fn sayHello(name: []const u8) void {
    printf("Hello, {s}!\n", .{name});
}

fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}
