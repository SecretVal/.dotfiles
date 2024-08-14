{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          ensureInstalled = ["all" pkgs.vimPlugins.nvim-treesitter-parsers.gleam];
          nixvimInjections = true;
          indent.enable = true;
        };
      };
      treesitter-textobjects = {
        enable = true;
        select = {
          enable = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";

            "ab" = "@block.outer";
            "ib" = "@block.inner";

            "aif" = "@conditional.outer";
            "iif" = "@conditional.inner";

            "al" = "@loop.outer";
            "il" = "@loop.inner";

            "at" = "@comment.outer";
            "it" = "@comment.inner";

            "s" = "@statement.outer";
            "as" = "@scopename.inner";
          };
        };
      };
      hmts.enable = true;
    };
  };
}
