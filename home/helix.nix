{ pkgs, ... }:

{
  # ── Helix editor ───────────────────────────────────────────────────────────
  # programs.helix.enable installs the binary and sets HELIX_RUNTIME so helix
  # can find its queries/themes at runtime. We deliberately set no settings
  # here so home-manager never generates a competing config.toml or
  # languages.toml — the files in config/helix/ are the sole source of truth.
  programs.helix = {
    enable        = true;
    defaultEditor = true;
  };

  # Symlink every helix config file from the repo into ~/.config/helix/.
  xdg.configFile."helix/config.toml".source    = ../config/helix/config.toml;
  xdg.configFile."helix/languages.toml".source = ../config/helix/languages.toml;
  xdg.configFile."helix/themes".source         = ../config/helix/themes;
  xdg.configFile."helix/yazi-picker.sh".source = ../config/helix/yazi-picker.sh;
}
