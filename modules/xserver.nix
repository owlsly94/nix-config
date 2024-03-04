{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.sddm = {
      enable = true;
      settings = {
        Autologin = {
          Session = "hyprland.desktop";
          User = "owlsly";
        };
      };
    };
    libinput = {
      enable = true;
    };
  };
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
