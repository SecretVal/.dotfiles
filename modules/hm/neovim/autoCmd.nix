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
            higroup = "IncSearch",
            timeout = 40,
          })
          end
          ''; 
        };
      }
    ];
  };
}
