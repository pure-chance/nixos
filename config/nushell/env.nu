# # setup nix
# source functions.nu
# let nix_daemon = "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
# load-env (open $nix_daemon | capture-foreign-env --shell zsh)

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
    ($nu.data-dir | path join 'completions')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.PATH = ($env.PATH | split row (char esep) | prepend [
    "/nix"
    "/opt/homebrew/bin"
    /bin
    "/usr/bin"
    "/sbin"
    "/usr/sbin"
    "/usr/local/bin"
    "/opt/homebrew/Cellar"
    "/opt/homebrew/sbin"
    "/opt/homebrew/bin"
    "/usr/local/mysql/bin"
    ~/.local/bin
    "~/.cargo/bin"
    "~/.cabal/bin"
    "~/.ghcup/bin"
    "~/.bun/bin"
    "~/.nix-profile/bin"
    "/Library/TeX/texbin"
    "/Library/Apple/usr/bin"
    "/System/Cryptexes/App/usr/bin"
    "/Users/chance/.modular/bin"
    "/Users/chance/.radicle/bin"
] | uniq)

$env.CONFIG_HOME = '~/.config'

$env.config.buffer_editor = "hx"
$env.EDITOR = "hx"
$env.VISUAL = "hx"

# force cargo to put build artifacts in the correct location
$env.CARGO_TARGET_DIR = "target"

# disable virtual env prompt on top of the prompt
# this prevents double virtualenv
$env.VIRTUAL_ENV_DISABLE_PROMPT = true

# save startship prompt
starship init nu | save -f ~/.cache/starship/init.nu
