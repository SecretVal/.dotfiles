{ config, pkgs, dotfilesDir, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    ./i3/i3.nix
    ./neovim/neovim.nix
    ./emacs/emacs.nix
    ./rofi/rofi.nix
  ];

  Home.stateVersion = "23.05"; # Please read the comment before changing.
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];


  home.sessionVariables = {
    EDITOR="EMACS";
  };
}
