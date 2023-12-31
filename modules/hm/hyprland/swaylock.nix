{config, pkgs, ...}:
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "${config.colorScheme.colors.base00}";
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "${config.colorScheme.colors.base05}";
      show-failed-attempts = true;
    };
  };
}
