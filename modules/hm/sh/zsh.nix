{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = "export PATH=/home/lukas/.cargo/bin:$PATH";
    shellAliases = {
      vim="nvim";
    };
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
    };
  };
}

