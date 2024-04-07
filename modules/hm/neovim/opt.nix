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
      swapfile = false;
      backup = false;
      undofile = true;

      splitright = true;
      splitbelow = true;

      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 15;
      signcolumn = "yes";

      completeopt = ["menu" "menuone" "noselect"];

      updatetime = 50;

      colorcolumn = "80";

      belloff = "all";

      list = true;
      lcs = "eol:↲,tab:» ,trail:·";
      conceallevel = 2;
      foldlevel = 999;

      virtualedit = "block";
      laststatus = 3;

      inccommand = "split";
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    filetype.extension.ul = "u-lang";
  };
}
