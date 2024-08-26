const types = @import("./types.zig");

pub const unclipped_rect: types.Rect = types.Rect {
    .x = 0,
    .y = 0,
    .width = 0x1000000,
    .height = 0x1000000,
};
