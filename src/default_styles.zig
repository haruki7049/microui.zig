const types = @import("./types.zig");

pub const unclipped_rect = types.Rect.init(0, 0, 0x1000000, 0x1000000);

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
        .text_color = types.Color.init(230, 230, 230, 255),
        .border_color = types.Color.init(25, 25, 25, 255),
        .windowbg_color = types.Color.init(50, 50, 50, 255),
        .titlebg_color = types.Color.init(25, 25, 25, 255),
        .titletext_color = types.Color.init(240, 240, 240, 255),
        .panelbg_color = types.Color.init(0, 0, 0, 0),
        .button_color = types.Color.init(75, 75, 75, 255),
        .buttonhover_color = types.Color.init(95, 95, 95, 255),
        .buttonfocus_color = types.Color.init(115, 115, 115, 255),
        .base_color = types.Color.init(30, 30, 30, 255),
        .basehover_color = types.Color.init(35, 35, 35, 255),
        .basefocus_color = types.Color.init(40, 40, 40, 255),
        .scrollbase_color = types.Color.init(43, 43, 43, 255),
        .scrollthumb_color = types.Color.init(30, 30, 30, 255),
    },
};
