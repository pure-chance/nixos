{ pkgs, ... }:

{
  # ── Niri Wayland compositor ────────────────────────────────────────────────
  programs.niri.enable = true;

  # ── Login manager: greetd + tuigreet ──────────────────────────────────────
  # tuigreet is a lightweight TTY greeter — no Wayland compositor to spin up,
  # so it appears almost instantly. --remember skips the username field after
  # the first login; --remember-session skips session selection entirely.
  # Tradeoff: the greeter runs in TTY so the canary layout isn't active there,
  # but every keystroke after login (niri session + swaylock) uses canary.
  services.greetd = {
    enable   = true;
    settings = {
      default_session = {
        command = pkgs.lib.concatStringsSep " " [
          "${pkgs.greetd.tuigreet}/bin/tuigreet"
          "--time"
          "--remember"
          "--remember-session"
          "--cmd niri-session"
        ];
        user = "greeter";
      };
    };
  };

  # ── XDG desktop portals ────────────────────────────────────────────────────
  # gtk portal handles file pickers; gnome portal handles screen sharing.
  xdg.portal = {
    enable       = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # ── swaylock PAM ───────────────────────────────────────────────────────────
  # Without this entry swaylock cannot verify the user's password.
  security.pam.services.swaylock = {};

  # ── Bluetooth ──────────────────────────────────────────────────────────────
  hardware.bluetooth.enable      = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable        = true;

  # ── System-level Wayland utilities ─────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    xdg-utils   # xdg-open, xdg-mime, etc.
  ];
}
