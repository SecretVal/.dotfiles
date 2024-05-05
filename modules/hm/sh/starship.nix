{...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      format = "$jobs$directory$character";
      right_format = "$all";
      add_newline = false;
    };
  };
}
