{...}: {
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;
      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            buffer = "[buf]";
            nvim_lsp = "[LSP]";
            path = "[path]";
            luasnip = "[snip]";
            neorg = "[neorg]";
          };
        };
      };
      cmp-buffer = {enable = true;};
      cmp-nvim-lsp = {enable = true;};
      cmp-path = {enable = true;};
      cmp_luasnip = {enable = true;};
      friendly-snippets = {enable = true;};
      cmp = {
        enable = true;
        settings = {
          sources = [
            {name = "luasnip";}
            {name = "nvim_lsp";}
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
          experimental.native_menu = false;
        };
      };
    };
    extraConfigLua =
      # lua
      ''
        local ls = require("luasnip")
        vim.keymap.set({"i"}, "<C-Y>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump( 1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
        	if ls.choice_active() then
        		ls.change_choice(1)
        	end
        end, {silent = true})
      '';
  };
}
