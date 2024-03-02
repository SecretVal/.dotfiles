{...}: {
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "mocha";
      customHighlights =
        # lua
        ''
          function(colors)
            return {
                NormalFloat = { blend = 17 },
                TreesitterContext = { bg = colors.none, fg = colors.text },
            }
          end
        '';
      integrations = {
        cmp = true;
        fidget = true;
        harpoon = true; # hi prime
        telescope.enabled = true; # hi tj
        treesitter = true;
        lsp_trouble = true;
        rainbow_delimiters = true;
        mini.enabled = true;
      };
    };
  };
}
