{...}: {
  programs.nixvim = {
    plugins = {
      neorg = {
        enable = true;
        settings.load = {
          "core.defaults".__empty = null;
          "core.concealer".__empty = null;
          "core.summary".__empty = null;
          "core.highlights".__empty = null;
          "core.qol.toc".__empty = null;
          "core.qol.todo_items".__empty = null;
          "core.integrations.treesitter".__empty = null;
        };
      };
    };
  };
}
