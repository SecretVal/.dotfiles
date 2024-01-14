{config, lib,...}:
{
  programs.nixvim = {
    autoCmd = [
      {
        event = "BufWritePre";
        pattern = "*";
        callback = {
          __raw = ''
          function()
          vim.lsp.buf.format()
          end
          ''; 
        };
      }
      {
        event = "TextYankPost";
        pattern = "*";
        callback = {
          __raw = ''
          function()
          vim.highlight.on_yank({
            timeout = 40,
          })
          end
          ''; 
        };
      }
    ];
  };
}
