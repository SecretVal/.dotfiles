{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      neorg = {
        enable = true;
        lazyLoading = true;
        modules = {
          "core.defaults".__empty = null;
          "core.concealer".__empty = null;
          "core.highlights".__empty = null;
          "core.completion".config.engine = "nvim-cmp";
        };
      };
    };
  };
}
