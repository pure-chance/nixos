{ pkgs, ... }:

{
  home.packages = [ pkgs.ghostty ];

  # Ghostty reads from ~/.config/ghostty/config
  xdg.configFile."ghostty/config".text = ''
    font-size = 13
    theme = dark
    shell-integration = detect
    # Ghostty will pick up your login shell (nushell) automatically
  '';
}
