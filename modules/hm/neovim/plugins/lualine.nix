{...}: {
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        theme = "auto";
        globalstatus = true;
      };
    };
  };
}
