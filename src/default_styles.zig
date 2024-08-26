const types = @import("./types.zig");

pub const unclipped_rect: types.Rect = types.Rect {
    .x = 0,
    .y = 0,
    .width = 0x1000000,
    .height = 0x1000000,
};

const default_style = types.Style {
    .font = undefined,
    .size = types.Vec2 {
        .x = 68,
        .y = 10,
    },
    .padding = 5,
    .spacing = 4,
    .indent = 24,
    .title_height = 24,
    .scrollbar_size = 12,
    .thumb_size = 8,
    .colors = types.ColorSet {
        .text_color = types.Color {
            .r = 230,
            .g = 230,
            .b = 230,
            .a = 255,
        },
        .border_color = types.Color {
            .r = 25,
            .g = 25,
            .b = 25,
            .a = 255,
        },
        .windowbg_color = types.Color {
            .r = 50,
            .g = 50,
            .b = 50,
            .a = 255,
        },
        .titlebg_color = types.Color {
            .r = 25,
            .g = 25,
            .b = 25,
            .a = 255,
        },
        .titletext_color = types.Color {
            .r = 240,
            .g = 240,
            .b = 240,
            .a = 255,
        },
        .panelbg_color = types.Color {
            .r = 0,
            .g = 0,
            .b = 0,
            .a = 0,
        },
        .button_color = types.Color {
            .r = 75,
            .g = 75,
            .b = 75,
            .a = 255,
        },
        .buttonhover_color = types.Color {
            .r = 95,
            .g = 95,
            .b = 95,
            .a = 255,
        },
        .buttonfocus_color = types.Color {
            .r = 115,
            .g = 115,
            .b = 115,
            .a = 255,
        },
        .base_color = types.Color {
            .r = 30,
            .g = 30,
            .b = 30,
            .a = 255,
        },
        .basehover_color = types.Color {
            .r = 35,
            .g = 35,
            .b = 35,
            .a = 255,
        },
        .basefocus_color = types.Color {
            .r = 40,
            .g = 40,
            .b = 40,
            .a = 255,
        },
        .scrollbase_color = types.Color {
            .r = 43,
            .g = 43,
            .b = 43,
            .a = 255,
        },
        .scrollthumb_color = types.Color {
            .r = 30,
            .g = 30,
            .b = 30,
            .a = 255,
        },
    },
};
