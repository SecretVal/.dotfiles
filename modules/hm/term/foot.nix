{config, pkgs, ...}:
{
  programs.foot = {
    enable = true;
    settings = {
      colors = {
        alpha=0.9;
      };
      main =  {
        font="JetBrainsMono Nerd Font:size=12:fontfeatures=dlig liga";
      };
    };
  };
}
