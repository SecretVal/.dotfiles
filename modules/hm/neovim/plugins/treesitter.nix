{pkgs, ...}: let
  u-lang-grammer = pkgs.tree-sitter.buildGrammar {
    language = "ul";
    version = "0.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "secretval";
      repo = "tree-sitter-u-lang";
      rev = "fbf1f0f827d1a4026ddb30842385079403326162";
      hash = "sha256-e4RKKzJQqQmqXoW+YDPYwB5J0h9AL+r/JFPzPbXiyII=";
    };
  };
in {
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = "all";
        nixvimInjections = true;
        indent = true;
        languageRegister.ul = "ul";
        grammarPackages = [u-lang-grammer] ++ pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
      treesitter-context.enable = true;
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
    extraConfigLua =
      # lua
      ''
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.ul = {
          filetype = "ul",
        }
      '';
  };
}
