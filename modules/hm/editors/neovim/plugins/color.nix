{...}: {
  programs.nixvim.colorschemes.gruvbox = {
    enable = true;
    settings = {
      contrast = "dark";
      transparent_mode = true;
    };
  };
}
