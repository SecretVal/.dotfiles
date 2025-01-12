{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        inlayHints = true;
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
        servers = {
          nixd = {
            enable = true;
            settings.options = {
              nixos.expr = "(builtins.getFlake \"github:secretval/.dotfiles\").nixosConfiguration.nixos.options";
              home-manager.expr = "(builtins.getFlake \"github:secretval/.dotfiles\").homeConfigurations.lukas.options";
            };
          };
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          ccls.enable = true;
          gopls.enable = true;
          kotlin_language_server.enable = true;
        };
      };
      fidget = {
        enable = true;
        settings = {
          notification.window = {
            winblend = 0;
            relative = "editor";
          };
        };
      };
      nvim-jdtls = {
        enable = true;
        cmd = ["${lib.getExe pkgs.jdt-language-server}"];
      };
    };
  };
}
