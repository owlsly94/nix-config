{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hosts/pc/hardware-configuration.nix
      ./modules/audio.nix
      ./modules/bootloader.nix
      ./modules/networking.nix
      ./modules/services.nix
      ./modules/system.nix
      ./modules/user.nix
      ./modules/wayland.nix
      ./modules/xserver.nix
      ./modules/packages.nix
    ];

  # Use Zsh as default shell
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Iosevka Font:
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
    ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}

