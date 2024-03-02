{...}: {
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
      pb = 17;

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
      splitbelow = true;

      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 999;
      signcolumn = "yes";

      completeopt = ["menuone" "noselect" "noinsert"];

      updatetime = 50;

      colorcolumn = "80";

      list = true;
      lcs = "eol:↲,tab:  ";
      conceallevel = 2;
      foldlevel = 999;

      virtualedit = "block";
      laststatus = 3;
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
