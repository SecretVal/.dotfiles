{ config, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        foreground = config.colorScheme.palette.base05;
        background = config.colorScheme.palette.base00;
      };
      main = {
        font = "JetBrainsMono Nerd Font:size=12:fontfeatures=calt dlig liga";
      };
      mouse = {
        hide-when-typing = " yes ";
      };
    };
  };
}

