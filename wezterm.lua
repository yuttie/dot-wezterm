local wezterm = require 'wezterm'

function map_font_attrs(family, intensity, style)
  local DEFAULT_INTENSITY = { Normal = 'Regular', Bold = 'Bold' }
  local DEFAULT_STYLE = { Normal = 'Normal', Italic = 'Italic' }
  local MAP = {
    ['Victor Mono'] = {
      intensity = { Normal = 'DemiBold', Bold = 'Black' },
      style = { Normal = 'Normal', Italic = 'Oblique' },
    },
    ['IBM Plex Sans JP'] = {
      intensity = { Normal = 'Medium', Bold = 'Bold' },
      style = { Normal = 'Normal', Italic = 'Normal' },
    },
    ['Source Han Sans'] = {
      intensity = { Normal = 'Medium', Bold = 'Black' },
      style = { Normal = 'Normal', Italic = 'Normal' },
    },
  }

  return {
    family = family,
    weight = ((MAP[family] or {})['intensity'] or DEFAULT_INTENSITY)[intensity] or DEFAULT_INTENSITY[intensity],
    style = ((MAP[family] or {})['style'] or DEFAULT_STYLE)[style] or DEFAULT_STYLE[style],
  }
end

function my_mono_fonts(intensity, style)
  return wezterm.font_with_fallback({
    map_font_attrs('Victor Mono', intensity, style),
    map_font_attrs('Noto Color Emoji', intensity, style),
    map_font_attrs('IBM Plex Sans JP', intensity, style),
    map_font_attrs('Source Han Sans', intensity, style),
    map_font_attrs('Symbols Nerd Font', intensity, style),
  })
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
  font_size = 12.0,
  font = my_mono_fonts('Normal', 'Normal'),
  font_rules = {
    {
      italic = true,
      intensity = 'Bold',
      font = my_mono_fonts('Bold', 'Italic'),
    },
    {
      italic = true,
      font = my_mono_fonts('Normal', 'Italic'),
    },
    {
      intensity = 'Bold',
      font = my_mono_fonts('Bold', 'Normal'),
    },
    {
      font = my_mono_fonts('Normal', 'Normal'),
    },
  },
  line_height = 1.0,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  freetype_interpreter_version = 40,
  freetype_load_flags = "NO_HINTING|NO_AUTOHINT",
  freetype_load_target = "HorizontalLcd",
  custom_block_glyphs = true,
  anti_alias_custom_block_glyphs = true,
  front_end = 'WebGpu',
  webgpu_power_preference = 'LowPower',
  keys = {
    { key = 'c',        mods = 'SHIFT|ALT',  action = wezterm.action{ CopyTo = 'Clipboard' } },
    { key = 'V',        mods = 'SHIFT|ALT',  action = wezterm.action{ PasteFrom = 'Clipboard' } },
    { key = 'PageDown', mods = 'CTRL',       action = 'DisableDefaultAssignment' },
    { key = 'PageUp',   mods = 'CTRL',       action = 'DisableDefaultAssignment' },
    { key = 'PageDown', mods = 'SHIFT',      action = 'DisableDefaultAssignment' },
    { key = 'PageUp',   mods = 'SHIFT',      action = 'DisableDefaultAssignment' },
    { key = 'Tab',      mods = 'CTRL',       action = 'DisableDefaultAssignment' },
    { key = 'Tab',      mods = 'CTRL|SHIFT', action = 'DisableDefaultAssignment' },
    { key = 'PageUp',   mods = 'CTRL|SHIFT', action = wezterm.action.ScrollByPage(-1) },
    { key = 'PageDown', mods = 'CTRL|SHIFT', action = wezterm.action.ScrollByPage(1) },
    { key = 'c',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'v',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'm',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'n',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '-',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '=',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '0',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 't',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'T',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'w',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '1',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '2',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '3',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '4',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '5',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '6',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '7',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '8',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '9',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = '[',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = ']',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'r',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'h',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'k',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
    { key = 'f',        mods = 'SUPER',      action = 'DisableDefaultAssignment' },
  },
  use_ime = true,
  color_scheme = 'Hydrangea',
  window_frame = {
    font_size = 12.0,
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
  max_fps = 120,
}
