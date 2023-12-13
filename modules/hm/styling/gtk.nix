{config, lib, pkgs, ...}:
{
  gtk.enable = true;
  gtk.cursorTheme = {
    package = pkgs.phinger-cursors;
    name="phinger-cursors";
    size = 26;
  };
  home.pointerCursor = {
    name = "phinger-cursors";
    package = pkgs.phinger-cursors;
    size = 26;
    gtk.enable = true;
    x11.enable = true;
  };
}
