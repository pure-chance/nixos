{ pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Locale / time
  time.timeZone               = "America/Los_Angeles"; # adjust as needed
  i18n.defaultLocale          = "en_US.UTF-8";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  
  # Sound via pipewire
  services.pulseaudio.enable  = false;
  security.rtkit.enable       = true;
  # services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  # Basic system packages
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    ripgrep
    fd
  ];

  # Allow unfree (Ghostty needs this on some builds)
  nixpkgs.config.allowUnfree = true;

  # Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store   = true;
  };
}
