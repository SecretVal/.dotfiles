{...}: {
  programs.nixvim = {
    plugins.neogit = {
      enable = true;
      settings.kind = "replace";
    };
    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>Neogit<cr>";
      }
    ];
  };
}
