{ ... }: {
  programs.nixvim = {
    plugins = {
      mini = {
        enable = true;
        modules = {
          ai = { n_lines = 500; };
          surround = { };
          statusline = { set_vim_settings = false; };
        };
      };
    };
  };
}
