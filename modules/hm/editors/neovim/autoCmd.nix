{...}: {
  programs.nixvim = {
    autoCmd = [
      {
        event = "TextYankPost";
        pattern = "*";
        callback = {
          __raw =
            # lua
            ''
              function()
              vim.highlight.on_yank({
                timeout = 40,
              })
              end
            '';
        };
      }
      {
        event = "TermOpen";
        pattern = "*";
        callback = {
          __raw =
            # lua
            ''
              function()
              vim.cmd("startinsert")
              end
            '';
        };
      }
    ];
  };
}
