{pkgs, overlays, ...}: {
  home = {
    username = "lukas";
    homeDirectory = "/home/lukas";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  imports = [
    ./modules/hm/fuzzel
    ./modules/hm/term
    ./modules/hm/sh
    ./modules/hm/neovim
    ./modules/hm/hypr
    ./modules/hm/macchina
    ./modules/hm/multiplexers/tmux.nix
    ./modules/hm/direnv/direnv.nix
    ./modules/hm/pkgs.nix
    ./modules/shared
  ];
  home.stateVersion = "23.05"; # Please read the comment before changing.
  nixpkgs.overlays = overlays;
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userEmail = "108518296+SecretVal@users.noreply.github.com";
    userName = "secretval";
    extraConfig.credentials = {
      "https://github.com".helper = "!/home/lukas/.nix-profile/bin/gh auth git-credential";
      "https://gist.github.com".helper = "!/home/lukas/.nix-profile/bin/gh auth git-credential";
    };
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
