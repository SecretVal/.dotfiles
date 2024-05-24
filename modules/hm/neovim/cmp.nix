{lib, ...}: {
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;
      lspkind.enable = true;
      cmp-buffer = {enable = true;};
      cmp-nvim-lsp = {enable = true;};
      cmp-path = {enable = true;};
      cmp_luasnip = {enable = true;};
      friendly-snippets = {enable = true;};
      cmp = {
        enable = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
            {name = "path";}
            {name = "buffer";}
          ];
          snippet.expand =
            # lua
            ''
              function(args)
                require("luasnip").lsp_expand(args.body)
              end
            '';
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
          };
          formatting = {
            format =
              lib.mkForce
              #lua
              ''
                require("lspkind").cmp_format({
                  mode = "symbol_text",
                  menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[api]",
                    path = "[path]",
                    luasnip = "[snip]",
                    neorg = "[neorg]",
                    emoji = "[emoji]",
                    crates = "[crates]",
                  },
                })
              '';
          };
          experimental = {
            native_menu = false;
            ghost_text = true;
          };
        };
      };
    };
  };
}
