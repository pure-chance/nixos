{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/keyboard.nix
    ../../modules/hyprland.nix
  ];

  networking.hostName = "chancebook";

  users.users.chance = {
    isNormalUser  = true;
    extraGroups   = [ "wheel" "networkmanager" "video" "audio" ];
    shell         = pkgs.nushell;
    group         = "chance";
  };
  users.groups.chance = {};

  # POSIX fallback shell — bash is always present on NixOS,
  # but declaring it explicitly ensures it's in the system path.
  programs.bash.enable = true;

  system.stateVersion = "24.11";
}
