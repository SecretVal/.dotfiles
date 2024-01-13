{config, lib,...}:
{
  programs.nixvim.keymaps = [
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
      key = "<leader>qo";
      action = "<cmd>copen<cr>";
    }
    {
      key = "<leader>qc";
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
      key = "<leader>ps";
      lua = true;
      action = ''
      function()
        require("telescope.builtin").grep_string( { search = vim.fn.input("Grep > ") } )
      end
      '';
    }
    {
      key = "<leader>u";
      lua = true;
      action= "vim.cmd.UndotreeToggle";
    }
    ];
}