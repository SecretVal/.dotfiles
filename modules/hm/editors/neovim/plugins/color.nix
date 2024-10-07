{...}: {
  programs.nixvim.colorschemes.gruvbox = {
    enable = true;
    settings = {
      terminal_colors = true;
      contrast = "";
      transparent_mode = true;
    };
  };
}
