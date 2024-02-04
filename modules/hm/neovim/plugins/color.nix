{ ... }: {
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;
      integrations = {
        cmp = true;
        fidget = true;
        harpoon = true; # hi prime
        telescope.enabled = true; # hi tj
        treesitter = true;
        treesitter_context = true;
        lsp_trouble = true;
        rainbow_delimiters = true;
      };
    };
  };
}
