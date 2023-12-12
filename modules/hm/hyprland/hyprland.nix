{ config, lib, pkgs, ... }:
{
  imports = [
    ./waybar.nix
  ];
  gtk.cursorTheme = {
    package = pkgs.phinger-cursors;
    size = 36;
  };
}
