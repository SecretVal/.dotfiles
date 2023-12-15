{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = "set fish_greeting";
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
    };
  };
}

