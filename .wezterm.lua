local wezterm = require("wezterm")

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick 
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

local config = {
    -- default shell
    default_prog = { "powershell.exe", "-NoLogo" },

    -- detect changes on config file
    automatically_reload_config = true,

    -- use IME
    use_ime = true,

    -- window appearance
    window_frame = {
        font = wezterm.font ("Hack Nerd Font", { weight='Bold' }),
        font_size = 11
    },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    window_decorations = "RESIZE",
    window_background_opacity = 1,
    text_background_opacity = 1,

    -- inactive pane
    inactive_pane_hsb = {
      saturation = 0.7,
      brightness = 0.9,
    },

    -- tab bar settings
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = true,
    tab_bar_at_bottom = true,
    show_new_tab_button_in_tab_bar = false,
    -- show_close_tab_button_in_tabs = false,

    -- font settings
    font = wezterm.font(
        'Hack Nerd Font'
    ),
    font_size = 13,

    -- colorscheme
    color_scheme = 'OneDark (base16)',

    -- color style
    colors = {
        tab_bar = {
            inactive_tab_edge = 'rgba(0,0,0,0)'
        }
    }
}

-- keybinds
config.keys = {
    {
        key = ':',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitHorizontal {
            domain = 'CurrentPaneDomain'
        },
    },
    {
        key = 'w',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'r',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.RotatePanes 'Clockwise'
    },
}

local function BaseName(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-window-title', function(tab)
  return BaseName(tab.active_pane.foreground_process_name)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local background = "#606060"
    local foreground = "#cbcbcb"
    local edge_background = 'none'

    if tab.is_active then
        background = "#34558a"
        foreground = "#FFFFFF"
    end

    local edge_foreground = background

    local title = BaseName(tab.active_pane.title)

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = "[" .. (tab.tab_index + 1) .. "]" .. title},
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
   }
   end)

return config
