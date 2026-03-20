{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    # env.nu — environment variables
    envFile.text = ''
      $env.EDITOR = "hx"
      $env.VISUAL = "hx"
    '';

  # Bash as POSIX fallback — minimal config, just ensures it's usable
  programs.bash = {
    enable        = true;
    shellAliases  = { hx = "helix"; };
  };
}
