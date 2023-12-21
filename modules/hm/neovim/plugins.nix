{config, lib, ...}:{
  programs.nixvim = {
    plugins = {
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      nix.enable = true;
      fugitive.enable = true;
      nvim-autopairs.enable = true;
      lualine = {
        enable = true;
        theme = "catppuccin";
        globalstatus = true;
      };
    };
  };
}
