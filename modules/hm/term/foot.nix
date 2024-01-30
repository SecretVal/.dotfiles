{ config, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        alpha = 0.9;
        foreground = config.colorScheme.palette.base05;
        background = config.colorScheme.palette.base00;
      };
      main = {
        font = "JetBrainsMono Nerd Font:size=12:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
