{ pkgs, ... }:

{
  home.packages = [ pkgs.ghostty ];

  # config/ghostty/config is the single source of truth.
  # Edit it in the repo; it mirrors to ~/.config/ghostty/config automatically.
  xdg.configFile."ghostty/config".source = ../config/ghostty/config;
}
