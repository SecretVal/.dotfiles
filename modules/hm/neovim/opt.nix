{config, lib,nixvim, ...}:{
  programs.nixvim = {
    globals = { 
      mapleader = " ";
      maplocalleader = " ";
      netrw_browser_split = 0;
      netrw_banner = 0;
      netrw_winsize = 25;
      langmap = "äöü";
    };
    options =  {
      guicursor = "";
        
      number = true;
      relativenumber = true;
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      smartindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;

      hlsearch = false;
      incsearch = true;

      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";

      updatetime = 50;

      colorcolumn = "80";

      list = true;
      listchars = "eol:↲";
    } ;
  };
}
