{...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = "$jobs$directory$character";
      right_format = "$all";
      add_newline = false;
    };
    enableTransience = true;
  };
}
