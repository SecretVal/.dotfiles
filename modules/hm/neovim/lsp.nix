{ pkgs, ... }: {
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
          clangd.enable = true;
          zls.enable = true;
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
    extraConfigLua =
      # lua
      ''
            local _border = "rounded"

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                    vim.lsp.handlers.hover, {
                    border = _border
                    }
                    )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                    vim.lsp.handlers.signature_help, {
                    border = _border
                    }
                    )

            vim.diagnostic.config{
                float={border=_border}
            };

        require('lspconfig.ui.windows').default_options = {
            border = _border
        }

        -- ocaml lsp
            require("lspconfig").ocamllsp.setup({})
      '';
  };
  home.packages = with pkgs; [
    ocamlPackages.ocaml-lsp
  ];
}
