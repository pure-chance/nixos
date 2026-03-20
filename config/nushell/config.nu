source functions.nu
source aliases.nu

# nix
# const nix_deamon = "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
# if ($nix_deamon | path exists) {
#   ^zsh -c $nix_deamon
# }

# configuration
$env.config = {
  show_banner: false
  table: {
    mode: "default"
  }
  rm: {
    always_trash: true
  }
}

# starship prompt
use ~/.cache/starship/init.nu

