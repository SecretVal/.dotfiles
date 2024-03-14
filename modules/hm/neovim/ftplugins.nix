{...}: {
  programs.nixvim = {
    files."ftplugin/go.lua" = {
      options = {
        expandtab = false;
      };
    };
    files."ftplugin/make.lua" = {
      options = {
        expandtab = false;
      };
    };
    files."ftplugin/c.lua" = {
      options = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
      };
    };
    files."ftplugin/nix.lua" = {
      options = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
      };
    };
  };
}
