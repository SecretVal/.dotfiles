{ config, pkgs, dotfilesDir, inputs, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    ./modules/hm/rofi/rofi.nix
    ./modules/hm/term/foot.nix
    ./modules/hm/neovim/neovim.nix
    ./modules/hm/sh/zsh.nix
    ./modules/hm/code/node.nix
    ./modules/hm/hyprland/hyprland.nix
  ];
  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Snow";
    size = 36;
  };


  home.stateVersion = "23.05"; # Please read the comment before changing.
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];


  home.sessionVariables = {
    EDITOR="nvim";
  };
}
