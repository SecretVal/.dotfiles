{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      #lualine
      lualine = {
        enable = true;
        theme = "catppuccin";
        globalstatus = true;
      };
    };
  };
}
