{config, pkgs, ...}:
{
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        alpha = 0.9;
        foreground = config.colorScheme.colors.base05;
        background=config.colorScheme.colors.base00;
      };
      main =  {
        font="JetBrainsMono Nerd Font:size=12:fontfeatures=cliga dlig liga";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
