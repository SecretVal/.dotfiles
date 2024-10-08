{...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = "$jobs$directory$character";
      right_format = "$all";
      add_newline = false;
    };
  };
}
