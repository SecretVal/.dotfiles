{config, lib, pkgs, ...}:
{
  gtk.enable = true;
  gtk= {
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 26;
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        size = "compact";
        tweaks = ["rimless"];
        variant = "mocha";
      };
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    gtk3 = {
      extraConfig = {
        Settings = ''
        gtk-application-prefer-dark-theme=1
        '';
      };
    };
    gtk4 = {
      extraConfig = {
        Settings = ''
        gtk-application-prefer-dark-theme=1
        '';
      };
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 26;
    gtk.enable = true;
    x11.enable = true;
  };

}
