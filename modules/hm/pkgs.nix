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

    qpwgraph
    pulsemixer
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
    qmk

    ghostty.packages.${system}.default

    # games
    lutris
    # music
    ardour
    bespokesynth
    audacious
    audacious-plugins

    distrho-ports
    # carla
    helm
    odin2
    tunefish
    redux
    surge
    surge-XT
    lsp-plugins
    dexed
    drumkv1
    samplv1
    synthv1
    drumgizmo
    x42-plugins
    x42-avldrums
    x42-gmsynth
    geonkick
    calf
    fluidsynth
    zynaddsubfx
    cardinal
    artyFX
    bchoppr
    dragonfly-reverb
    eq10q
    infamousPlugins
    oxefmsynth
    sfizz
    ChowKick
    ChowPhaser
    ChowCentaur
    CHOWTapeModel
    swh_lv2
    airwindows
    wolf-shaper
    tap-plugins
    aether-lv2
    ninjas2
    stochas
    fire
    bslizr

    linuxsampler
    qsampler
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
        "sidebar.verticalTabs" = true;
        "sidebar.expandOnHover" = true;
        "general.autoScroll" = true;
        "browser.download.alwaysOpenPanel" = true;
        "browser.download.panel.shown" = true;
        "browser.toolbars.bookmarks.visibility" = "newtab";
        "browser.compactmode.show" = true;
        "widget.non-native-theme.scrollbar.style" = 3;
        "browser.tabs.closeWindowWithLastTab" = false;
        "browser.tabs.tabmanager.enabled" = true;
        "mousewheel.default.delta_multiplier_y" = 300;

        "browser.vpn_promo.enabled" = false;
        "extensions.pocket.enabled" = false;

        "toolkit.telemetry.*" = false;
        "datareporting.usage.uploadEnabled" = false;
        "browser.dataFeatureRecommendations.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.recommendationprovider" = false;
        "browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;

        "network.http.rcwn.enabled" = false;
        "general.smoothScroll.msdPhysics.enabled" = true;

        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
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
        vimium
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
