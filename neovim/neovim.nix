{pkgs, config, nixvim, ...}:
{
  imports = [
    nixvim.homeManagerModules.nixvim 
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
      chadtree.enable = true;
      neogit  = {
        enable = true;
        autoRefresh = true;
      };
      nvim-autopairs.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust-analyzer.enable = true;
          nixd.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          cssls.enable = true;
          cmake.enable = true;
          bashls.enable = true; 
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>pf"="find_files";
          "<C-p>"="git_files";
          "<leader>vh"="help_tags";
        };
      };
    };
    keymaps = [
      {
        key="<leader>e";
        action="<cmd>CHADopen<CR>";
        options = {
          silent=true;
          desc="Open ChadTree because I am a chad!";
        };
      }
      {
        key="<leader>E";
        action="<cmd>CHADopen<CR>";
        options = {
          silent=true;
          desc="Open ChadTree because I am a chad!";
        };
      }
    ];
  };
}
