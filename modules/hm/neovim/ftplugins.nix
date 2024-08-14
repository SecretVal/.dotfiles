{...}: {
  programs.nixvim = {
    files."ftplugin/go.lua" = {
      opts = {
        expandtab = false;
      };
    };
    files."ftplugin/make.lua" = {
      opts = {
        expandtab = false;
      };
    };
    files."ftplugin/c.lua" = {
      opts = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
      };
    };
    files."ftplugin/nix.lua" = {
      opts = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
      };
    };
    files."ftplugin/gleam.lua" = {
      opts = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
      };
    };
  };
}
