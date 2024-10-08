{...}: {
  programs.nixvim.colorschemes.gruvbox = {
    enable = true;
    settings = {
      terminal_colors = true;
      transparent_mode = true;
      contrast = "";
    };
  };
}
