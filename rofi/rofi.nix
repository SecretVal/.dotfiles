{ config, lib, pkgs,dotfilesDir, ... }:

{
  programs.rofi = {
      package = pkgs.rofi-wayland;
      terminal= "foot";
      enable = true;
      theme=(dotfilesDir + "/rofi/config2.rasi");
  };
}
