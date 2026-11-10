local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ============================================================
-- Forest Retreat | Everforest Dark Medium
-- Ubuntu 26.04 GNOME / Wayland
-- Design: Misty Forest · Soft Light · Calm Workspace
-- ============================================================

-- 1. 視窗外觀
config.initial_cols = 100
config.initial_rows = 28

config.window_padding = {
    left = 14,
    right = 14,
    top = 12,
    bottom = 12,
}

-- 保留些微透明度，避免背景干擾閱讀
config.window_background_opacity = 0.96

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- 2. 字體
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0
config.line_height = 1.15

-- 3. Forest Retreat 色彩
-- Everforest Dark Medium inspired
config.colors = {
    background = "#1E2320",
    foreground = "#D8DED9",

    cursor_bg = "#8DA399",
    cursor_fg = "#1E2320",
    
    cursor_border = "#A7C080",

    selection_bg = "#4A7C59",
    selection_fg = "#FFFFFF",

    scrollbar_thumb = "#475258",

    split = "#543A48",

    ansi = {
        "#343F44", -- black
        "#E67E80", -- red
        "#A7C080", -- green
        "#DBBC7F", -- yellow
        "#7FBBB3", -- blue
        "#D699B6", -- magenta
        "#83C092", -- cyan
        "#D3C6AA", -- white
    },

    brights = {
        "#475258", -- bright black
        "#E67E80", -- bright red
        "#A7C080", -- bright green
        "#DBBC7F", -- bright yellow
        "#7FBBB3", -- bright blue
        "#D699B6", -- bright magenta
        "#83C092", -- bright cyan
        "#D3C6AA", -- bright white
    },

    tab_bar = {
        background = "#2D353B",

        active_tab = {
            bg_color = "#475258",
            fg_color = "#D3C6AA",
            intensity = "Normal",
        },

        inactive_tab = {
            bg_color = "#343F44",
            fg_color = "#859289",
        },

        inactive_tab_hover = {
            bg_color = "#475258",
            fg_color = "#D3C6AA",
        },

        new_tab = {
            bg_color = "#2D353B",
            fg_color = "#859289",
        },

        new_tab_hover = {
            bg_color = "#475258",
            fg_color = "#D3C6AA",
        },
    },
}

-- 4. 游標與滾動
config.default_cursor_style = "SteadyBar"
config.cursor_thickness = 0.12
config.scrollback_lines = 10000

-- 5. Shell
config.default_prog = { "/usr/bin/zsh", "--login" }

-- 6. 快捷鍵
config.keys = {
    {
        key = "Enter",
        mods = "ALT|SHIFT",
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = "Enter",
        mods = "ALT",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "F",
        mods = "CTRL|SHIFT",
        action = wezterm.action.Search({
            CaseInSensitiveString = "",
        }),
    },
    {
        key = "V",
        mods = "CTRL|SHIFT",
        action = wezterm.action.PasteFrom("Clipboard"),
    },
    {
        key = "C",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CopyTo("Clipboard"),
    },
    {
        key = "=",
        mods = "CTRL",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        key = "-",
        mods = "CTRL",
        action = wezterm.action.DecreaseFontSize,
    },
    {
        key = "0",
        mods = "CTRL",
        action = wezterm.action.ResetFontSize,
    },
    {
        key = "E",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CloseCurrentPane({
            confirm = false,
        }),
    },
    {
        key = "Space",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateCopyMode,
    },
}

return config
