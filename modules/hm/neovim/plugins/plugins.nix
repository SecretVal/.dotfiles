{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      #lualine
      lualine = {
        enable = true;
        theme = "catppuccin";
        globalstatus = true;
      };
      nix.enable = true;
      #nvim-autopairs
      nvim-autopairs = {
        enable = true;
        checkTs = true;
      };
      comment-nvim.enable = true;
      markdown-preview.enable = true;
      undotree.enable = true;
      rainbow-delimiters.enable = true;
    };
  };
}
