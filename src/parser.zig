const std = @import("std");

pub const Commands = enum { STATUS, START, STOP };

//QUESTIONS: Should I work with [*:0]u8 for strings, or convert them to []u8
pub fn parseCommand(command: []const u8) Commands {
    // const normalize = try normalize(command);
    // switch (normalize) {}
    _ = command;
    return Commands.STATUS;
}

fn normalize(input: [*:0]u8) [*:0]u8 {
    return input;
}

//NOTE: [*:0] is a sentinel terminated pointer
// Basically it ends with a literal byte value 0
// The * in *:0 means it can have many elements.
pub fn parse(args: [][*:0]u8) i32 {
    if (args.len == 0) {
        return 2000;
    } else {
        return 20;
    }
}

test "running with no arguments return 1" {
    // NOTE: You can create an empty array as follows
    // const empty: [][*:0]u8 = &.{};
    // .{} Creates the array, whyst & takes the reference to that array
    // Zig will coerce the array in a slice
    try std.testing.expectEqual(1, parse(&.{}));
}
