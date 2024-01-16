{
  pkgs,
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
    };
  };
}
