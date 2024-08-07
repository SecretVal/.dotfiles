{...}: {
  programs.nixvim = {
    plugins = {
      neorg = {
        enable = false;
        modules = {
          "core.defaults".__empty = null;
          "core.concealer".__empty = null;
          "core.summary".__empty = null;
          "core.highlights".__empty = null;
          "core.mode".__empty = null;
          "core.integrations.treesitter".__empty = null;
          "core.integrations.nvim-cmp".__empty = null;
          "core.completion".config.engine = "nvim-cmp";
        };
      };
    };
  };
}
