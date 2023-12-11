{config, pkgs, ...}:
{
  programs.foot = {
    enable = true;
    settings = {
      main= {
        alpha=0.9;
      };
    };
  };
}
