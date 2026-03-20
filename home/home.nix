{ pkgs, ... }:

{
  imports = [
    ./ghostty.nix
    ./nushell.nix
    ./helix.nix
  ];

  xdg.configFile."hypr".source          = ../configs/hypr;
  xdg.configFile."helix".source         = ../configs/helix;
  xdg.configFile."ghostty".source       = ../configs/ghostty;
  xdg.configFile."starship.toml".source = ../configs/starship.toml;

  programs.starship = {
    enable = true;
    # We set enableNushellIntegration explicitly — this tells home-manager
    # to generate the init.nu cache file automatically on activation,
    # so your config.nu's `use ~/.cache/starship/init.nu` always finds it
    enableNushellIntegration = true;
  };
  
  home.stateVersion  = "24.11";
  programs.home-manager.enable = true;
}
