{ config, lib, pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];
  programs.nushell = {
    enable = true;

    extraConfig = "
    $env.config = {
      show_banner: false,
    }
    ";
  };
}

