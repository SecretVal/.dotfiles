{...}: {
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;
      customHighlights = ''
        function(colors)
        return {
          Pmenu = { bg = colors.base, fg = colors.text},
          NormalFloat = { bg = colors.base, fg = colors.text, blend=17},
          TreesitterContext = { bg = colors.none, fg = colors.text },
        }
        end
      '';
      integrations = {
        fidget = true;
        harpoon = true; # hi prime
        telescope.enabled = true; # hi tj
      };
    };
  };
}
