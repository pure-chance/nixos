$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
    ($nu.data-dir | path join 'completions')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

$env.PATH = ($env.PATH | split row (char esep) | prepend [
    ($env.HOME | path join ".cargo" "bin")
    ($env.HOME | path join ".local" "bin")
] | uniq)

$env.CONFIG_HOME = ($env.HOME | path join ".config")

$env.EDITOR  = "hx"
$env.VISUAL  = "hx"

# Keep cargo build artifacts inside the project, not scattered globally
$env.CARGO_TARGET_DIR = "target"

# Prevent virtualenv from injecting its own prompt on top of starship
$env.VIRTUAL_ENV_DISABLE_PROMPT = true

# Generate the starship init script on every shell start.
# config.nu does `use ~/.cache/starship/init.nu` to activate it.
starship init nu | save --force ~/.cache/starship/init.nu
