{
  nix-colors,
  overlays,
  ...
}: {
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    nix-colors.homeManagerModules.default
    ./modules/hm/rofi/rofi.nix
    ./modules/hm/term/foot.nix
    ./modules/hm/neovim
    ./modules/hm/sh
    ./modules/hm/code/node.nix
    ./modules/hm/hyprland/hyprland.nix
    ./modules/hm/styling/gtk.nix
    ./modules/hm/styling/qt.nix
    ./modules/hm/multiplexers/tmux.nix
    ./modules/hm/multiplexers/zellij.nix
    ./modules/hm/direnv/direnv.nix
    ./modules/hm/pkgs.nix
  ];
  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.overlays = overlays;
}
