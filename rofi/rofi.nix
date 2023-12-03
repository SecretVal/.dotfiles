{ config, lib, pkgs,dotfilesDir, ... }:

{
  programs.rofi = {
      terminal="alacritty";
      enable = true;
      theme=(dotfilesDir + "/rofi/nord.rasi");
  };
}
