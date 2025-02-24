-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font "IosevkaTerm Nerd Font Mono"
config.font_size = 14.0

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'AlwaysPrompt'

-- and finally, return the configuration to wezterm
return config
