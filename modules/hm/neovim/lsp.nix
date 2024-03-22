{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          html.enable = true;
          jsonls.enable = true;
          lua-ls = {
            enable = true;
            settings = {};
          };
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
        capabilities =
          # lua
          ''
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
    };
    extraConfigLua =
      # lua
      ''
        require("lspconfig").ocamllsp.setup({ })

        local client = vim.lsp.start_client({
        	name = "u-lang-lsp",
        	cmd = { "/home/lukas/Dokumente/coding/u-lang/u-lang-lsp/main" },
        	on_attach = function() end,
        })

        vim.api.nvim_create_autocmd("FileType", {
        	pattern = "u-lang",
        	callback = function()
        		vim.lsp.buf_attach_client(0, client)
        	end,
        })
      '';
  };
  home.packages = with pkgs; [
    ocamlPackages.ocaml-lsp
  ];
}
