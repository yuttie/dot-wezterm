local wezterm = require 'wezterm'

function my_mono_fonts(params)
  return wezterm.font_with_fallback({
    'Victor Mono',
    'Symbols Nerd Font',
    'Noto Color Emoji',
    'IBM Plex Sans JP',
  }, params)
end

function my_sans_fonts(params)
  return wezterm.font_with_fallback({
    'Inter',
    'Noto Color Emoji',
    'IBM Plex Sans JP',
  }, params)
end

return {
  term = 'wezterm',
  cursor_blink_rate = 500,
  font_size = 8.0,
  font = my_mono_fonts({ weight='DemiBold', style='Normal' }),
  font_rules = {
    {
      italic = true,
      intensity = 'Bold',
      font = my_mono_fonts({ weight='Black', style='Oblique' }),
    },
    {
      italic = true,
      font = my_mono_fonts({ weight='DemiBold', style='Oblique' }),
    },
    {
      intensity = 'Bold',
      font = my_mono_fonts({ weight='Black', style='Normal' }),
    },
  },
  line_height = 0.9,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  freetype_interpreter_version = 40,
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  keys = {
    { key='c', mods='SHIFT|ALT', action=wezterm.action{CopyTo='Clipboard'} },
    { key='V', mods='SHIFT|ALT', action=wezterm.action{PasteFrom='Clipboard' }},
  },
  use_ime = true,
  color_scheme = 'Spacegray Dark',
  window_frame = {
    font_size = 7.0,
    font = my_sans_fonts({ weight='Bold' }),
  },
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  adjust_window_size_when_changing_font_size = false,
  window_close_confirmation = "NeverPrompt",
}
