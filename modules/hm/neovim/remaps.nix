{...}: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>pe";
      action = "<cmd>Explore<cr>";
    }
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      key = "<leader>o";
      action = "<cmd>copen<cr>";
    }
    {
      key = "<leader>q";
      action = "<cmd>cclose<cr>";
    }
    {
      key = "<leader>j";
      action = "<cmd>cnext<cr>";
    }
    {
      key = "<leader>k";
      action = "<cmd>cprevious<cr>";
    }
    {
      key = "<leader>u";
      lua = true;
      action = "vim.cmd.UndotreeToggle";
    }
  ];
}
