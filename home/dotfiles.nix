{ ... }:

{
  # ── Dotfiles ────────────────────────────────────────────────────────────────
  # Every entry here symlinks a file or directory from config/ in the repo
  # into ~/.config/ on the live system.  Edit in the repo; the change is live
  # immediately (the symlink target updates without re-running home-manager).
  #
  # Rules:
  #   • Programs that need Nix shell wiring (nushell, starship, helix) manage
  #     their own links inside their respective *.nix modules.
  #   • Desktop compositor files (niri, waybar, fuzzel, mako) are linked in
  #     desktop.nix alongside the packages that read them.
  #   • Everything else lands here.

  # ── bat ─────────────────────────────────────────────────────────────────────
  xdg.configFile."bat/config".source             = ../config/bat/config;
  xdg.configFile."bat/themes".source             = ../config/bat/themes;

  # ── jujutsu ──────────────────────────────────────────────────────────────────
  xdg.configFile."jj/config.toml".source         = ../config/jj/config.toml;

  # ── starship ─────────────────────────────────────────────────────────────────
  # programs.starship.enable = true (in shell.nix) installs the binary.
  # The actual config is here so you can edit config/starship.toml directly.
  xdg.configFile."starship.toml".source           = ../config/starship.toml;

  # ── television ───────────────────────────────────────────────────────────────
  xdg.configFile."television/config.toml".source              = ../config/television/config.toml;
  xdg.configFile."television/default_channels.toml".source    = ../config/television/default_channels.toml;
  xdg.configFile."television/cable/files.toml".source         = ../config/television/cable/files.toml;
  xdg.configFile."television/cable/dirs.toml".source          = ../config/television/cable/dirs.toml;

  # ── Zed editor ───────────────────────────────────────────────────────────────
  # We link only the hand-edited config files, not the binary databases that
  # Zed generates at runtime (embeddings, prompts, conversations).
  xdg.configFile."zed/settings.json".source      = ../config/zed/settings.json;
  xdg.configFile."zed/keymap.json".source        = ../config/zed/keymap.json;
  xdg.configFile."zed/tasks.json".source         = ../config/zed/tasks.json;
}
