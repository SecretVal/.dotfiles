{ config, lib, pkgs,dotfilesDir, ... }:

{
  programs.rofi = {
      package = pkgs.rofi-wayland;
      terminal= "foot";
      enable = true;
      theme=(./theme.rasi);
      extraConfig = {
          modi = "run,drun,window";
          icon-theme = "Oranchelo";
          show-icons = true;
          drun-display-format = "{icon} {name}";
          location = 0;
          disable-history = false;
          hide-scrollbar = true;
          display-drun = "   Apps ";
          display-run = "   Run ";
          display-window = " 﩯  Window";
          display-Network = " 󰤨  Network";
          sidebar-mode = true;
      };
  };
}
