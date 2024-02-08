{ ... }: {
  programs.nixvim = {
    plugins = {
      # git
      git-worktree = {
        enable = true;
        enableTelescope = true;
        changeDirectoryCommand = "tcd";
      };
      fugitive.enable = true;
      gitsigns.enable = true;
    };
    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>Git<cr>";
      }
      {
        key = "<leader>ga";
        action = "<cmd>G add .<cr>";
      }
    ];
  };
}
