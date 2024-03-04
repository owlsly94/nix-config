{ pkgs, ... }:
  {
    # Use GRUB instead of SystemD boot
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
    };
  }
