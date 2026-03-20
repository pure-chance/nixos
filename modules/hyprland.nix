{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # XDG portal for screen sharing, file pickers, etc.
  xdg.portal = {
    enable      = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    waybar
    rofi
    swww          # wallpaper daemon
    wl-clipboard
    grim          # screenshot
    slurp         # region select (used with grim)
    mako          # notifications
    networkmanagerapplet
  ];
}
