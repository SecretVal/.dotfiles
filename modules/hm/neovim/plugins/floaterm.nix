{ ... }:
{
  programs.nixvim = {
    plugins.floaterm = {
      enable = true;
    };
    keymaps = [
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
    ];
  };
}
