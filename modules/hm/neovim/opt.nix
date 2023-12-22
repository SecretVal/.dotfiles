{config, lib,nixvim, ...}:{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
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
    };
    extraConfigLua = ''
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    vim.opt.isfname:append("@-@")
    '';
  };
}