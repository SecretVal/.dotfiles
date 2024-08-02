{...}: {
  programs.nixvim = {
    plugins.lazygit.enable = true;
    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>LazyGit<cr>";
      }
    ];
  };
}
