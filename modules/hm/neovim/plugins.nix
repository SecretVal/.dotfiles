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
      harpoon = {
        enable = true;
        keymapsSilent = true;
        keymaps = {
          addFile = "<leader>a";
          toggleQuickMenu = "<C-e>";
          navFile = {
            "1" = "<C-j>";
            "2" = "<C-k>";
            "3" = "<C-l>";
          };
        };
      };
      comment-nvim.enable = true;
      fidget = {
        enable = true;
        notification = {
          window = {
            winblend = 0;
            relative = "editor";
          };
        };
      };
      markdown-preview.enable = true;
    };
  };
}
