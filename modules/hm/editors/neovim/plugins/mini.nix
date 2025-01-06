{...}: {
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      statusline = {
        enable = true;
      };
    };
  };
}
