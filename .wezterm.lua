local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 10
config.font = wezterm.font("UDEV Gothic 35NF")
config.default_prog = { "tmux", "new-session", "-A", "-s", "main", "zsh" }
config.color_scheme = "Catppuccin Macchiato (Gogh)"

config.keys = {
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

return config
