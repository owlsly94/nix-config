{ ... }:
{
  users.users = {
    owlsly = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  nix.settings.allowed-users = [ "owlsly" ];
}
