{...}: {
  programs.nixvim = {
    plugins = {
      # git
      git-worktree = {
        enable = true;
        enableTelescope = true;
        changeDirectoryCommand = "tcd";
      };
      neogit = {
        enable = true;
        settings.kind = "floating";
      };
      gitsigns.enable = true;
    };
    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>Neogit<cr>";
      }
    ];
  };
}
