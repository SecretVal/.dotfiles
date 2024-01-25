{...}: {
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "mocha";
      customHighlights = ''
        function(colors)
        return {
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
