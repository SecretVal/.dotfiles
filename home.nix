{ config, pkgs, dotfilesDir, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    (dotfilesDir + "/i3/i3.nix")
    (dotfilesDir + "/neovim/neovim.nix")
    (dotfilesDir + "/emacs/emacs.nix")
    (dotfilesDir + "/rofi/rofi.nix")
  ];

  home.stateVersion = "23.05"; # Please read the comment before changing.
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  home.sessionVariables = {

    WLR_RENDERER_ALLOW_SOFTWARE=1;
  };

}
