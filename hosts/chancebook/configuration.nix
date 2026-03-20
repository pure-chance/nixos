{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/keyboard.nix
    ../../modules/niri.nix
    ../../modules/fonts.nix
  ];

  networking.hostName = "chancebook";

  users.users.chance = {
    isNormalUser = true;
    extraGroups  = [ "wheel" "networkmanager" "video" "audio" "input" ];
    shell        = pkgs.nushell;
    group        = "chance";
  };
  users.groups.chance = {};

  programs.bash.enable = true;

  system.stateVersion = "24.11";
}
