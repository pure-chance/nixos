{ pkgs, ... }:

{
  # ── Nushell (login shell) ──────────────────────────────────────────────────
  # We enable nushell for proper Nix shell integration (PATH wiring, etc.) but
  # point its config and env files directly at our repo's config/ directory so
  # config/nushell/*.nu is the single source of truth.
  programs.nushell = {
    enable          = true;
    configFile.source = ../config/nushell/config.nu;
    envFile.source    = ../config/nushell/env.nu;
  };

  # Additional nushell files that config.nu sources at startup.
  # home-manager writes these alongside config.nu in ~/.config/nushell/.
  xdg.configFile."nushell/aliases.nu".source        = ../config/nushell/aliases.nu;
  xdg.configFile."nushell/functions.nu".source      = ../config/nushell/functions.nu;
  xdg.configFile."nushell/theme-catppuccin.nu".source = ../config/nushell/theme-catppuccin.nu;

  # ── Starship prompt ────────────────────────────────────────────────────────
  # enable = true installs the binary and puts it on PATH.
  # Shell integration is handled manually: config/nushell/env.nu runs
  # `starship init nu | save -f ~/.cache/starship/init.nu`
  # and config/nushell/config.nu does `use ~/.cache/starship/init.nu`.
  # We do NOT set settings here — config/starship.toml is the source of truth.
  programs.starship.enable = true;

  # ── Bash (POSIX fallback / emergency shell) ────────────────────────────────
  programs.bash = {
    enable       = true;
    shellAliases = {
      hx = "helix";
    };
  };
}
