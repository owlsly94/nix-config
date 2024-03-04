{ pkgs, ... }:
{
  # Hostname and network config
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    ];
}
