let palette = {
  rosewater: "#f5e0dc"
  flamingo: "#f2cdcd"
  pink: "#f5c2e7"
  mauve: "#cba6f7"
  red: "#f38ba8"
  maroon: "#eba0ac"
  peach: "#fab387"
  yellow: "#f9e2af"
  green: "#a6e3a1"
  teal: "#94e2d5"
  sky: "#89dceb"
  sapphire: "#74c7ec"
  blue: "#89b4fa"
  lavender: "#b4befe"
  text: "#cdd6f4"
  subtext1: "#bac2de"
  subtext0: "#a6adc8"
  overlay2: "#9399b2"
  overlay1: "#7f849c"
  overlay0: "#6c7086"
  surface2: "#585b70"
  surface1: "#45475a"
  surface0: "#313244"
  base: "#1e1e2e"
  mantle: "#181825"
  crust: "#11111b"
}

let theme = {
  separator: $palette.overlay0
  leading_trailing_space_bg: $palette.overlay0
  header: $palette.green
  date: $palette.mauve
  filesize: $palette.blue
  row_index: $palette.pink
  bool: $palette.peach
  int: $palette.peach
  duration: $palette.peach
  range: $palette.peach
  float: $palette.peach
  string: $palette.green
  nothing: $palette.peach
  binary: $palette.peach
  cellpath: $palette.peach
  hints: dark_gray

  shape_garbage: { fg: $palette.crust bg: $palette.red attr: b }
  shape_bool: $palette.blue
  shape_int: { fg: $palette.mauve attr: b}
  shape_float: { fg: $palette.mauve attr: b}
  shape_range: { fg: $palette.yellow attr: b}
  shape_internalcall: { fg: $palette.blue attr: b}
  shape_external: { fg: $palette.blue attr: b}
  shape_externalarg: $palette.text 
  shape_literal: $palette.blue
  shape_operator: $palette.yellow
  shape_signature: { fg: $palette.green attr: b}
  shape_string: $palette.green
  shape_filepath: $palette.yellow
  shape_globpattern: { fg: $palette.blue attr: b}
  shape_variable: $palette.text
  shape_flag: { fg: $palette.blue attr: b}
  shape_custom: {attr: b}
}
