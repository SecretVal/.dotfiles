{config, lib,nixvim,...}:{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        nixd.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        cssls.enable = true;
        cmake.enable = true;
        bashls.enable = true; 
        gopls.enable = true;
      };
      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>dj" = "goto_next";
          "<leader>dk" = "goto_prev";
        };
        lspBuf = {
          "gd" = "definition";
          "gr" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>r" = "rename";
          "<leader>ca" ="code_action";
        };
      };
    };
  };
}
