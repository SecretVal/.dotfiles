{ ... }: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      netrw_browser_split = 0;
      netrw_banner = 0;
      netrw_winsize = 25;
      langmap = "äöü";
    };
    options = {
      guicursor = "";

      number = true;
      relativenumber = true;

      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      smartindent = true;
      breakindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;
      splitright = true;

      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 999;
      signcolumn = "yes";

      updatetime = 50;

      colorcolumn = "80";

      list = true;
      lcs = "eol:↲,tab:  ,extends:☛,precedes:☚";
      conceallevel = 2;
      foldlevel = 999;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    files."ftplugin/go.lua" = {
      options = {
        expandtab = false;
      };
    };
  };
}
