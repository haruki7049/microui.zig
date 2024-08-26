pub const Font = undefined;
pub const Id = usize;
pub const Real = f64;

pub const PoolItem = struct {
    id: Id,
    last_update: isize,
};

pub const BaseCommand = struct {
    type: isize,
    size: isize,
};

pub const ClipCommand = struct {
    base: BaseCommand,
    rect: Rect,
};

pub const RectCommand = struct {
    base: BaseCommand,
    rect: Rect,
    color: Color,
};

pub const TextCommand = struct {
    base: BaseCommand,
    font: Font,
    pos: Vec2,
    color: Color,
    str: [] u8,
};
pub const Vec2 = struct {
    x: isize,
    y: isize,
};

pub const Rect = struct {
    x: isize,
    y: isize,
    width: isize,
    height: isize,
};

pub const Color = struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,

    pub fn init(r: u8, g: u8, b: u8, a: u8) Color {
        return Color {
            .r = r,
            .g = g,
            .b = b,
            .a = a,
        };
    }
};

pub const ColorSet = struct {
    text_color: Color,
    border_color: Color,
    windowbg_color: Color,
    titlebg_color: Color,
    titletext_color: Color,
    panelbg_color: Color,
    button_color: Color,
    buttonhover_color: Color,
    buttonfocus_color: Color,
    base_color: Color,
    basehover_color: Color,
    basefocus_color: Color,
    scrollbase_color: Color,
    scrollthumb_color: Color,
};

pub const Command = union {
    type: isize,
    base: BaseCommand,
    jump: JumpCommand,
    clip: ClipCommand,
    rect: RectCommand,
    text: TextCommand,
    icon: IconCommand,
};

pub const JumpCommand = struct {
    base: BaseCommand,
    dst: void,
};

pub const IconCommand = struct {
    base: BaseCommand,
    rect: Rect,
    id: Id,
    color: Color,
};

pub const Container = struct {
    tail: Command,
    head: Command,
    rect: Rect,
    body: Rect,
    content_size: Vec2,
    scroll: Vec2,
    zindex: isize,
    open: isize,
};

pub const Style = struct {
    font: Font,
    size: Vec2,
    padding: isize,
    spacing: isize,
    indent: isize,
    title_height: isize,
    scrollbar_size: isize,
    thumb_size: isize,
    colors: ColorSet,
};

pub const Context = struct {
    text_width: fn (font: Font, str: u8, len: isize) isize,
    text_height: fn (font: Font) isize,
    draw_frame: fn (ctx: Context, rect: Rect, colorid: isize) void,

    _style: Style,
    style: Style,
    hover: Id,
    focus: Id,
    last_id: Id,
    last_rect: Rect,
    last_zindex: isize,
};

const Mouse = enum {
    LEFT,
    RIGHT,
    MIDDLE,
};

const Key = enum {
    SHIFT,
    CTRL,
    ALT,
    BACKSPACE,
    RETURN,
};
