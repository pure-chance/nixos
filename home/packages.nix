{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # ── Shell utilities ────────────────────────────────────────────────────────
    bat            # cat with syntax highlighting
    eza            # modern ls
    fd             # friendly find
    ripgrep        # fast grep
    dust           # intuitive du replacement
    sd             # sed replacement
    hexyl          # hex viewer
    tree           # directory tree
    jq             # JSON processor
    ouch           # unified compress / decompress
    asciinema      # terminal recorder
    eva            # calculator REPL
    hyperfine      # benchmarking
    tokei          # code statistics
    btop           # system monitor
    xplr           # TUI file explorer
    yazi           # TUI file manager
    zellij         # terminal multiplexer
    television     # fuzzy picker (tv)
    monolith       # save full web pages as single HTML

    # ── Version control ────────────────────────────────────────────────────────
    jujutsu        # jj — modern Git-compatible VCS
    gh             # GitHub CLI

    # ── Build / dev tools ─────────────────────────────────────────────────────
    gcc
    gnumake
    cmake
    ninja
    pkg-config
    openssl
    sccache        # compilation cache
    cargo-binstall # install Cargo binaries fast
    bacon          # background Rust compiler checker
    just           # Justfile command runner
    marksman       # Markdown LSP
    harper         # grammar LSP

    # ── Language runtimes & package managers ──────────────────────────────────
    deno
    nodejs
    python312
    uv             # fast Python package manager
    pixi           # conda-compatible environment manager

    # ── Media ─────────────────────────────────────────────────────────────────
    ffmpeg
    yt-dlp
    mpv

    # ── AI ────────────────────────────────────────────────────────────────────
    ollama

  ];
}
