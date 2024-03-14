{...}: {
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      surround = {};
      statusline = {set_vim_settings = false;};
    };
  };
}
