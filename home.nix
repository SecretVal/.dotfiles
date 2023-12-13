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
    ./modules/hm/styling/gtk.nix
    ./modules/hm/styling/stylix.nix
  ];
  home.stateVersion = "23.05"; # Please read the comment before changing.
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.font-awesome
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];


  home.sessionVariables = {
    EDITOR="nvim";
  };
}
