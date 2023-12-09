{pkgs, config, nixvim, ...}:
{
  imports = [
    nixvim.homeManagerModules.nixvim 
    ./lsp.nix
    ./telescope.nix
  ];

  programs.nixvim = {
    enable = true;
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
    colorschemes.catppuccin = {
      enable = true;
      transparentBackground = true;
    };
    plugins = {
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      nix.enable = true;
      neogit  = {
        enable = true;
        autoRefresh = true;
      };
      nvim-autopairs.enable = true;
    };
  };
}
