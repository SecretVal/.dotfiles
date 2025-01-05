{...}: {
  programs.nixvim = {
    plugins = {
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
      luasnip = {
        enable = true;
      };
      cmp = {
        enable = true;

        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
          mapping = {
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
          };
          snippet.expand = ''
            function(args)
              vim.snippet.expand(args.body)
            end
          '';
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
