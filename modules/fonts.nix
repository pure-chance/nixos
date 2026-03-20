{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      # ── Nerd Fonts ─────────────────────────────────────────────────────────
      nerd-fonts.jetbrains-mono    # JetBrains Mono NF — Ghostty, Zed, fuzzel
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      nerd-fonts.symbols-only      # icon glyphs usable with any base font

      # ── Monospace ──────────────────────────────────────────────────────────
      ibm-plex        # IBM Plex Mono / Sans / Serif / Math
      iosevka
      jetbrains-mono
      julia-mono

      # ── Serif / display ────────────────────────────────────────────────────
      libertinus

      # ── Sans-serif ─────────────────────────────────────────────────────────
      open-sans

      # ── Unicode / emoji coverage ───────────────────────────────────────────
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "IBM Plex Mono" "Noto Sans Mono" ];
        sansSerif = [ "IBM Plex Sans" "Open Sans" "Noto Sans"                    ];
        serif     = [ "IBM Plex Serif" "Libertinus Serif"                        ];
        emoji     = [ "Noto Color Emoji"                                         ];
      };
    };
  };
}
