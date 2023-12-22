{ config, lib, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];
  programs.fish = {
    enable = true;
    shellInit = "set fish_greeting";
  };
}

