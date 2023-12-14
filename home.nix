{ config, pkgs, dotfilesDir, inputs, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    inputs.nix-colors.homeManagerModules.default
    ./modules/hm/rofi/rofi.nix
    ./modules/hm/mako/mako.nix
    ./modules/hm/term/foot.nix
    ./modules/hm/neovim/neovim.nix
    ./modules/hm/sh/zsh.nix
    ./modules/hm/code/node.nix
    ./modules/hm/hyprland/hyprland.nix
    ./modules/hm/styling/gtk.nix
    ./modules/hm/styling/nix-colors.nix
  ];
  home.stateVersion = "23.05"; # Please read the comment before changing.
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.font-awesome
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];
  colorScheme = inputs.nix-colors.colorSchemes.dracula;
  home.sessionVariables = {
    EDITOR="nvim";
  };
}
