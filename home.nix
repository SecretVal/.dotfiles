{overlays, ...}: {
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./modules/hm/rofi/rofi.nix
    ./modules/hm/term/foot.nix
    ./modules/hm/neovim
    ./modules/hm/sh
    ./modules/hm/sway/sway.nix
    ./modules/hm/macchina
    ./modules/hm/multiplexers/tmux.nix
    ./modules/hm/direnv/direnv.nix
    ./modules/hm/pkgs.nix
  ];
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.overlays = overlays;
  programs.firefox.enable = true;
  programs.git = {
    enable = true;
    userEmail = "108518296+SecretVal@users.noreply.github.com";
    userName = "secretval";
  };
}
