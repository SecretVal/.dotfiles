{overlays, ...}: {
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./modules/hm/fuzzel
    ./modules/hm/term/foot.nix
    ./modules/hm/neovim
    ./modules/hm/sh
    ./modules/hm/hypr
    ./modules/hm/macchina
    ./modules/hm/multiplexers/tmux.nix
    ./modules/hm/direnv/direnv.nix
    ./modules/hm/pkgs.nix
    ./modules/hm/fastfetch
    ./modules/shared
  ];
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.overlays = overlays;
  programs.firefox.enable = true;
  programs.git = {
    enable = true;
    userEmail = "108518296+SecretVal@users.noreply.github.com";
    userName = "secretval";
    extraConfig.credentials = {
      "https://github.com".helper = "!/run/current-system/sw/bin/gh auth git-credential";
      "https://gist.github.com".helper = "!/run/current-system/sw/bin/gh auth git-credential";
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };
}
