{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.9;
    };
  };
}
