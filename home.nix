{ config, pkgs, dotfilesDir, inputs, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    # ./i3/i3.nix
    ./wm/awesome/awesome.nix
    ./neovim/neovim.nix
    ./rofi/rofi.nix
    ./sh/zsh.nix
    ./term/kitty.nix
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
