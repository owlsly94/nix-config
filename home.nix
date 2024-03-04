{ config, pkgs, ... }:

{
  home.username = "owlsly";
  home.homeDirectory = "/home/owlsly";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.highlighters = [
      "main"
    ];
  initExtraFirst = ''
      HISTFILE=~/.histfile
      HISTSIZE=1000
      SAVEHIST=1000
      setopt autocd nomatch
      unsetopt beep extendedglob notify
      autoload -Uz compinit
      compinit
    '';
  initExtra = ''
      zstyle ":completion:*" menu select
      zstyle ":completion:*" matcher-list "" "m:{a-z0A-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
    '';
  syntaxHighlighting.enable = true;
  shellAliases = {
    l = "eza --icons  -a --group-directories-first -1";
    ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
    ".." = "cd ..";
    v = "nvim";
    sv = "sudo nvim";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[ 󰏒 ](bold green)";
        error_symbol = "[ 󰏒 ](bold red)";
      };
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        };
      };
  };

  gtk = {
    enable = true;
    # TokyNight Theme:
    #theme = {
    #  name = "Tokyonight-Dark-B-LB";
    #  package = pkgs.tokyo-night-gtk;
    #};
    # Nightfox Dusk Theme:
    theme = {
      name = "Nightfox-Dusk-B-LB";
      package = pkgs.nightfox-gtk-theme;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };

    # Icon Themes:

    # Nord Theme:
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy";
    };

    # Font:
    font = {
      name = "Iosevka Nerd Font";
      size = 12;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 14;
    };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
      };
  };

  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
