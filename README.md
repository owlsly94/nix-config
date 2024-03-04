# My NixOS Config

## Rebuild the system
* Clone the directory in your ~/(home partition)
* cd(change directory into ~/nix-config/)
* Run the following commands:
```
sudo nixos-rebuild switch --flake .
```
```
home-manager switch --flake .
```
* To update the flake:
```
nix flake update
```
* To clean the store
```
nix-store --gc
```
* To clean your system from prevous generations:
```
nix-collect-garbage --delete-old && sudo nix-collect-garbage -d
```
* Update Channels:
```
sudo nix-channel --update
```
```
sudo nixos-rebuild switch --upgrade-all
```

