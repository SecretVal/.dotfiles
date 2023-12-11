{ config, pkgs, dotfilesDir, inputs, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    ./rofi/rofi.nix
    ./term/foot.nix
    ./neovim/neovim.nix
    ./sh/zsh.nix
    ./code/node.nix
  ];

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
