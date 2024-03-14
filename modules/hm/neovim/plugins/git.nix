{...}: {
  programs.nixvim = {
    plugins = {
      # git
      git-worktree = {
        enable = true;
        enableTelescope = true;
        changeDirectoryCommand = "tcd";
      };
      neogit.enable = true;
      gitsigns.enable = true;
    };
    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>NeoGit<cr>";
      }
    ];
  };
}
