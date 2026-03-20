{ pkgs, inputs, ... }:

{
  # ── Wayland / desktop packages ─────────────────────────────────────────────
  home.packages = with pkgs; [
    # status bar + notifications + launcher + locker
    waybar
    mako
    fuzzel
    swaylock

    # wallpaper daemon
    swww

    # file manager (GUI) + image viewer + PDF viewer
    nautilus
    loupe
    evince

    # screenshot
    grim
    slurp

    # media
    mpv

    # browsers / editors
    zed-editor
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  # ── Session environment ────────────────────────────────────────────────────
  # Ensure all Wayland-native toolkit hints are set for the niri session.
  home.sessionVariables = {
    NIXOS_OZONE_WL        = "1";   # Electron / CEF apps use Wayland
    MOZ_ENABLE_WAYLAND    = "1";   # Firefox / Zen
    QT_QPA_PLATFORM       = "wayland";
    SDL_VIDEODRIVER       = "wayland";
    CLUTTER_BACKEND       = "wayland";
    XDG_SESSION_TYPE      = "wayland";
    XDG_CURRENT_DESKTOP   = "niri";
    XCURSOR_SIZE          = "32";
    XCURSOR_THEME         = "Adwaita";
    GTK_THEME             = "Adwaita-dark";
  };

  # ── Color scheme (dark) ────────────────────────────────────────────────────
  # Sets the XDG color-scheme preference to dark. Apps that query the settings
  # portal (Zen, Electron, etc.) will respect this and render in dark mode.
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    gtk-theme    = "Adwaita-dark";
  };

  # ── Cursor ─────────────────────────────────────────────────────────────────
  # Sets cursor theme and size for both GTK apps and the compositor itself.
  home.pointerCursor = {
    gtk.enable = true;
    name       = "Adwaita";
    package    = pkgs.adwaita-icon-theme;
    size       = 32;
  };

  # ── GTK theming ────────────────────────────────────────────────────────────
  gtk = {
    enable = true;

    theme = {
      name    = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name    = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name    = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size    = 24;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  # ── Desktop config files ────────────────────────────────────────────────────
  xdg.configFile."niri/config.kdl".source   = ../config/niri/config.kdl;
  xdg.configFile."niri/wallpaper.sh" = {
    source     = ../config/niri/wallpaper.sh;
    executable = true;
  };
  xdg.configFile."waybar".source            = ../config/waybar;
  xdg.configFile."mako/config".source       = ../config/mako/config;
  xdg.configFile."fuzzel/fuzzel.ini".source = ../config/fuzzel/fuzzel.ini;
}
