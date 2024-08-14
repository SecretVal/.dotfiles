{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          htmx.enable = true;
          gopls.enable = true;
          zls.enable = true;
          kotlin-language-server.enable = true;
          java-language-server.enable = true;
          ccls.enable = true;
          gleam.enable = true;
        };
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>dk" = "goto_prev";
            "<leader>dj" = "goto_next";
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
      '';
  };
  home.packages = with pkgs; [
    ocamlPackages.ocaml-lsp
  ];
}
