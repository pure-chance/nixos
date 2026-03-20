{ pkgs, inputs, ... }:

{
  imports = [
    ./shell.nix
    ./helix.nix
    ./ghostty.nix
    ./desktop.nix
    ./dotfiles.nix
    ./packages.nix
  ];

  home.username      = "chance";
  home.homeDirectory = "/home/chance";

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
