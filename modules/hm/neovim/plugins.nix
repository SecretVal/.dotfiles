{config, lib, ...}:{
  programs.nixvim = {
    plugins = {
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      nix.enable = true;
      # git
      git-worktree = {
        enable = true;
        enableTelescope = true;
      };
      fugitive.enable = true;
      gitsigns = {
        enable = true;
      };
      #nvim-autopairs
      nvim-autopairs.enable = true;
      lualine = {
        enable = true;
        theme = "catppuccin";
        globalstatus = true;
      };
    };
  };
}
