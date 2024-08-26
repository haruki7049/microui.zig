pub const mu_Font = undefined;
pub const mu_Id = usize;
pub const mu_Real = f64;

pub const mu_PoolItem = struct {
    id: mu_Id,
    last_update: isize,
};

pub const unclipped_rect: mu_Rect = mu_Rect {
    .x = 0,
    .y = 0,
    .width = 0x1000000,
    .height = 0x1000000,
};

pub const mu_BaseCommand = struct {
    type: isize,
    size: isize,
};

pub const mu_ClipCommand = struct {
    base: mu_BaseCommand,
    rect: mu_Rect,
};

pub const mu_RectCommand = struct {
    base: mu_BaseCommand,
    rect: mu_Rect,
    color: mu_Color,
};

pub const mu_TextCommand = struct {
    base: mu_BaseCommand,
    font: mu_Font,
    pos: mu_Vec2,
    color: mu_Color,
    str: [] u8,
};
pub const mu_Vec2 = struct {
    x: isize,
    y: isize,
};

pub const mu_Rect = struct {
    x: isize,
    y: isize,
    width: isize,
    height: isize,
};

pub const mu_Color = struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};

pub const mu_Command = union {
    type: isize,
    base: mu_BaseCommand,
    jump: mu_JumpCommand,
    clip: mu_ClipCommand,
    rect: mu_RectCommand,
    text: mu_TextCommand,
    icon: mu_IconCommand,
};

pub const mu_JumpCommand = struct {
    base: mu_BaseCommand,
    dst: void,
};

pub const mu_IconCommand = struct {
    base: mu_BaseCommand,
    rect: mu_Rect,
    id: mu_Id,
    color: mu_Color,
};

pub const mu_Container = struct {
    tail: mu_Command,
    head: mu_Command,
    rect: mu_Rect,
    body: mu_Rect,
    content_size: mu_Vec2,
    scroll: mu_Vec2,
    zindex: isize,
    open: isize,
};

pub const mu_Style = struct {
    font: mu_Font,
    size: mu_Vec2,
    padding: isize,
    spacing: isize,
    indent: isize,
    title_height: isize,
    scrollbar_size: isize,
    thumb_size: isize,
    colors: [] mu_Color,
};

pub const mu_Context = struct {
    text_width: fn (font: mu_Font, str: u8, len: isize) isize,
    text_height: fn (font: mu_Font) isize,
    draw_frame: fn (ctx: mu_Context, rect: mu_Rect, colorid: isize) void,

    _style: mu_Style,
    style: mu_Style,
    hover: mu_Id,
    focus: mu_Id,
    last_id: mu_Id,
    last_rect: mu_Rect,
    last_zindex: isize,
};

const mu_Mouse = enum {
    LEFT,
    RIGHT,
    MIDDLE,
};

const mu_Key = enum {
    SHIFT,
    CTRL,
    ALT,
    BACKSPACE,
    RETURN,
};
