{ ... }:
{
  services = {
    openssh.enable = true;
    dbus.enable = true;
    xserver = {
      layout = "us";
      xkbVariant = "";
      libinput.enable = true;
      };
  };
}
