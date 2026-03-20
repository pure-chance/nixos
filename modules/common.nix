{ pkgs, ... }:

{
  # ── Boot ───────────────────────────────────────────────────────────────────
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ── Networking ─────────────────────────────────────────────────────────────
  networking.networkmanager.enable = true;

  # ── Locale / time ──────────────────────────────────────────────────────────
  time.timeZone      = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  # ── SSH ────────────────────────────────────────────────────────────────────
  services.openssh = {
    enable                          = true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin        = "no";
  };

  # ── Sound (PipeWire) ───────────────────────────────────────────────────────
  services.pulseaudio.enable = false;
  security.rtkit.enable      = true;
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  # ── Graphics ───────────────────────────────────────────────────────────────
  hardware.graphics.enable = true;

  # ── DBus / Polkit ──────────────────────────────────────────────────────────
  services.dbus.enable   = true;
  security.polkit.enable = true;

  # ── Base system packages ───────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    wl-clipboard   # wl-copy / wl-paste — needed by many CLI tools
    brightnessctl  # screen brightness control
    playerctl      # media key support
  ];

  # ── Nix ────────────────────────────────────────────────────────────────────
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store   = true;
  };
}
