
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.enable_tab_bar = false

-- style {{{
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- For example, changing the color scheme:
config.color_scheme = 'Gruber (base16)'

-- and finally, return the configuration to wezterm
return config
