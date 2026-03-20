{ config, ... }:

{
  # ── Register the Canary XKB layout ─────────────────────────────────────────
  services.xserver.xkb.extraLayouts.canary = {
    description = "Canary optimised Latin keyboard layout";
    languages   = [ "eng" ];
    symbolsFile = ../modules/xkb/canary;
  };

  # ── Activate canary system-wide ────────────────────────────────────────────
  # Wayland compositors (niri, cage) read layout from services.xserver.xkb.*
  # even when X11 itself is not running.
  services.xserver.xkb.layout = "canary";

  # XKB_DEFAULT_LAYOUT  — picked up by any libxkbcommon-based compositor
  # XKB_CONFIG_ROOT     — tells libxkbcommon where to find the custom symbols
  #                       file that NixOS compiled from extraLayouts above.
  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "canary";
    XKB_CONFIG_ROOT    = "${config.services.xserver.xkb.dir}";
  };

  # Propagate into the greetd systemd unit so that cage (which hosts the
  # regreet GTK greeter) also uses canary before the user session starts.
  systemd.services.greetd.environment = {
    XKB_DEFAULT_LAYOUT = "canary";
    XKB_CONFIG_ROOT    = "${config.services.xserver.xkb.dir}";
  };
}
