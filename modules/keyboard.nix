{ config, ... }:

{
  services.xserver.xkb.extraLayouts.canary = {
    description = "Canary optimised Latin keyboard layout";
    languages   = [ "eng" ];
    symbolsFile = ../modules/xkb/canary;
  };

  environment.sessionVariables = {
    XKB_CONFIG_ROOT = "${config.services.xserver.xkb.dir}";
  };
}
