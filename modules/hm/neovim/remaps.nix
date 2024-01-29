{ ... }: {
  programs.nixvim.keymaps = [
    {
      key = "<leader>nt";
      lua = true;
      action = ''
        function()
                vim.cmd({
                        cmd = "FloatermNew",
                        args = {
                                "--height=0.9",
                                "--width=0.9",
                                vim.fn.input("cmd > "),
                        },
                })
        end
      '';
    }
    {
      key = "<leader>pe";
      lua = true;
      action = ''
        function()
                vim.cmd({
                        cmd = "FloatermNew",
                        args = {
                                "--height=0.75",
                                "--width=0.75",
                    "nnn -Hde",
                    vim.fn.expand("%:p:h"),
                        },
                })
        end
      '';
    }
    {
      mode = "t";
      key = "<Esc>";
      action = ''<C-\><C-n>'';
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
