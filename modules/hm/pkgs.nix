{
  pkgs,
  inputs,
  ghostty,
  system,
  ...
}: {
  # nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  }; # fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # ESSENTIAL
    woomer
    edb
    gdb
    gf
    fasm
    gnumake
    gcc
    c3c
    odin
    nodePackages.nodejs
    nodePackages.pnpm
    jetbrains.idea-community-bin

    util-linux
    font-awesome #
    corefonts

    sl
    cowsay
    nitch
    deadbeef
    alejandra
    fortune
    dwt1-shell-color-scripts
    kdePackages.kclock
    calc
    fzf
    typioca
    watchexec
    man
    wget
    file
    sesh
    (vesktop.override {
      withMiddleClickScroll = true;
    })
    appimage-run
    pokeget-rs
    prismlauncher

    libresprite
    krita
    inkscape
    mypaint
    mypaint-brushes
    mypaint-brushes1
    libsForQt5.qt5.qtwayland
    glfw-wayland-minecraft

    htop
    git-extras
    gh
    killall

    # gui
    qpwgraph
    lxqt.pavucontrol-qt
    bluez
    swww

    #dev
    just
    fasm

    #extra
    bitwarden
    openssl
    bat
    ripgrep
    rhythmbox
    ffmpeg
    vlc
    mangohud
    protonmail-desktop

    # my pkgs
    inputs.kix.packages.${system}.default

    swayimg
    libreoffice
    ferdium
    sshfs
    unetbootin

    ghostty.packages.${system}.default

    # games
    lutris
    # flightgear
  ];
  programs.helix = {
    enable = true;
    languages = {
      language-server.rust-analyzer = {
        command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      };
    };
  };

  programs.floorp = {
    enable = true;
    profiles.default = {
      settings = {
        "browser.download.alwaysOpenPanel" = true;
        "browser.download.panel.shown" = true;
      };

      search = {
        default = "unduck";
        engines = {
          "unduck" = {
            urls = [
              {
                template = "https://unduck.link";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };

          "Nix" = {
            urls = [
              {
                template = "https://mynixos.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nix"];
          };
          "Github" = {
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "type";
                    value = "repositories";
                  }
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            definedAliases = ["@gh"];
          };
          "Github User" = {
            urls = [
              {
                template = "https://github.com/search";
                params = [
                  {
                    name = "type";
                    value = "users";
                  }
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            definedAliases = ["@ghu"];
          };
        };
        force = true;
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
        youtube-shorts-block
      ];
    };
  };
  programs.thunderbird = {
    enable = true;
    profiles = {};
  };
  programs.zathura.enable = true;
  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus-Dark";
  };
  services.cliphist.enable = true;
  programs.fastfetch.enable = true;
}
