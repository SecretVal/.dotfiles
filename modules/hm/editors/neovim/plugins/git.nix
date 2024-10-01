{...}: {
  programs.nixvim = {
    plugins = {
      neogit = {
        enable = true;
        settings.kind = "replace";
      };
      octo = {
        enable = true;
      };
    };
    keymaps = [
      {
        key = "<leader>gs";
        action = "<cmd>Neogit<cr>";
      }
    ];
  };
}
