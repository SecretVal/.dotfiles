{
  config,
  lib,
  ...
}: {
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;
      customHighlights = ''
        function(colors)
        return {
          NormalFloat = { bg = colors.base, fg = colors.text, blend=10},
          Pmenu = { bg = colors.base, fg = colors.text,blend=10},
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
