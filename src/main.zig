const std = @import("std");
const punch = @import("punch");
const parser = @import("parser.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const spans = try toSpans(allocator, std.os.argv[1..]);
    defer allocator.free(spans);

    // TODO: Bug as it can have 0 etc etc
    std.debug.print("Span: {s}\n", .{spans[0]});

    const command = parser.parseCommand(spans[0]);
    std.debug.print("Command: {s}\n", .{@tagName(command)});
    //NOTE: It's an optional value
    std.debug.print("Command2: {?s}\n", .{std.enums.tagName(parser.Commands, command)});
}

pub fn toSpans(allocator: std.mem.Allocator, args: [][*:0]u8) ![][]const u8 {
    const results = try allocator.alloc([]const u8, args.len);

    for (args, 0..) |arg, i| {
        results[i] = std.mem.span(arg); // No & needed
    }
    return results;
}

test {
    _ = parser;
}
