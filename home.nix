{ config, pkgs, dotfilesDir, inputs, nix-colors,... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports  = [
    nix-colors.homeManagerModules.default
    ./modules/hm/rofi/rofi.nix
    ./modules/hm/term/foot.nix
    ./modules/hm/term/wezterm.nix
    ./modules/hm/neovim
    ./modules/hm/sh/shell.nix
    ./modules/hm/code/node.nix
    ./modules/hm/hyprland/hyprland.nix
    ./modules/hm/styling/gtk.nix
    ./modules/hm/styling/qt.nix
    ./modules/hm/zellij/zellij.nix
    ./modules/hm/direnv/direnv.nix
  ];
  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
  home.stateVersion = "23.05"; # Please read the comment before changing.
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.font-awesome
    (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

}
