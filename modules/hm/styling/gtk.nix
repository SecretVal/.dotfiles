{config, lib, pkgs, ...}:
{
  gtk.enable = true;
  gtk= {
    cursorTheme = {
      package = pkgs.catppuccin-cursors;
      name="catppuccin-cursors";
      size = 26;
    };
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-gtk";
    };
  };
  home.pointerCursor = {
    name = "catppuccin-cursors";
    package = pkgs.catppuccin-cursors;
    size = 26;
    gtk.enable = true;
    x11.enable = true;
  };

}
