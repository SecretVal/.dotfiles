{config, lib, ...}:{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = "all";
      };
      treesitter-context.enable = true;
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
            "4" = "<C-ö>";
          };
        };
      };
      comment-nvim.enable = true;
      markdown-preview.enable = true;
    };
  };
}
