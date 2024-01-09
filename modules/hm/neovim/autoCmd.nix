{config, lib,...}:
{
  programs.nixvim = {
    autoCmd = [
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
