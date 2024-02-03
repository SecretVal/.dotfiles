{ ... }: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          cssls.enable = true;
          cmake.enable = true;
          bashls.enable = true;
          gopls.enable = true;
          tsserver.enable = true;
        };
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>dj" = "goto_next";
            "<leader>dk" = "goto_prev";
            "<leader>ds" = "open_float";
          };
          lspBuf = {
            "gd" = "definition";
            "gr" = "references";
            "gt" = "type_definition";
            "gi" = "implementation";
            "K" = "hover";
            "<leader>r" = "rename";
            "<leader>ca" = "code_action";
          };
        };
        capabilities = ''
          vim.keymap.set("n", "<leader>dl", "<cmd>TroubleToggle<cr>", { silent = true })
        '';
      };
      fidget = {
        enable = true;
        notification = {
          window = {
            winblend = 0;
            relative = "editor";
          };
        };
      };
      trouble.enable = true;
      lspkind.enable = true;
    };
  };
}
