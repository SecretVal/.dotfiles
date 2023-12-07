{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    initExtra = "export PATH=/home/lukas/.cargo/bin:$PATH";
  };
}
