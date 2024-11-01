{
  pkgs,
  config,
  inputs,
  ...
}: {
  # nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };
  # fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    util-linux
    font-awesome

    sl
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
    via
    xonotic

    libresprite
    godot_4
    krita
    libsForQt5.qt5.qtwayland
    jdk
    jetbrains.idea-community-bin
    glfw-wayland-minecraft

    htop
    git
    gh
    killall

    # gui
    qpwgraph
    lxqt.pavucontrol-qt
    bluez
    swww

    #dev
    just

    #extra
    bitwarden
    openssl
    bat
    ripgrep
    rhythmbox
    ffmpeg
    vlc

    # my pkgs
    inputs.kix.packages.x86_64-linux.default

    swayimg
    pixel-code
  ];
  programs.helix = {
    enable = true;
    languages = {
      language-server.rust-analyzer = {
        command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      };
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "browser.download.alwaysOpenPanel" = true;
        "browser.download.panel.shown" = true;
      };

      search = {
        engines = {
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
      extensions = with config.nur.repos.rycee.firefox-addons; [
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
}
