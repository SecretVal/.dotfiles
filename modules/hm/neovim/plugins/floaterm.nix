{...}: {
  programs.nixvim = {
    plugins.floaterm = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader>nt";
        lua = true;
        action =
          #lua
          ''
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
        mode = "t";
        key = "<Esc>";
        action = ''<C-\><C-n>'';
      }
    ];
  };
}
