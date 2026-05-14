local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- --- 1. 視窗外觀與行為 ---
config.initial_cols = 100
config.initial_rows = 28
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}
config.window_background_opacity = 0.95 -- 提高對比度，增加背景遮罩
config.macos_window_background_blur = 20 -- 支援背景模糊
config.hide_tab_bar_if_only_one_tab = true -- 只有一個分頁時隱藏分頁列
config.window_decorations = "TITLE | RESIZE" -- 保留標題列與縮放邊框，方便操作
config.window_close_confirmation = "NeverPrompt" -- 關閉視窗時不跳出確認警告

-- --- 2. 字體系統配置 ---
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0
config.line_height = 1.15 -- 增加行高

-- --- 3. 色彩方案：高對比專業版 ---
config.colors = {
	foreground = "#FFFFFF", -- 純白文字，提升對比
	background = "#000000", -- 純黑背景，提升對比
	cursor_bg = "#FFFFFF",
	cursor_fg = "#000000",
	cursor_border = "#FFFFFF",
	selection_bg = "#44475A",
	scrollbar_thumb = "#44475A",
	split = "#44475A",

	ansi = {
		"#000000", -- black
		"#FF5555", -- red
		"#50FA7B", -- green
		"#F1FA8C", -- yellow
		"#BD93F9", -- blue
		"#FF79C6", -- magenta
		"#8BE9FD", -- cyan
		"#BFBFBF", -- white
	},
	brights = {
		"#999999", -- black
		"#FF6E6E", -- red
		"#69FF94", -- green
		"#FFFFA5", -- yellow
		"#D6ACFF", -- blue
		"#FF92DF", -- magenta
		"#A4FFFF", -- cyan
		"#FFFFFF", -- white
	},
}

-- --- 4. 游標與滾動緩衝 ---
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_thickness = 0.15 -- 游標粗細
config.scrollback_lines = 10000

-- --- 5. 選取與系統行為 ---
config.default_prog = { "/usr/bin/zsh", "--login" }

-- --- 6. 快捷鍵綁定 ---
config.keys = {
	-- 全螢幕切換 (Alt + Shift + Enter)
	{ key = "Enter", mods = "ALT|SHIFT", action = wezterm.action.ToggleFullScreen },
	-- 禁用 Alt + Enter 的預設全螢幕切換，以便在 Gemini CLI 中換行
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
	-- 搜尋 (Ctrl + Shift + F)
	{ key = "F", mods = "CTRL|SHIFT", action = wezterm.action.Search({ CaseInSensitiveString = "" }) },
	-- 貼上 (Ctrl + Shift + V)
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	-- 複製 (Ctrl + Shift + C)
	{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	-- 字體大小調整 (Ctrl + +/-/0)
	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
	-- 關閉當前分頁/視窗 (Ctrl + Shift + E)
	{ key = "E", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	-- 進入 Vi 模式 (Ctrl + Shift + Space)
	{ key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
}

return config
