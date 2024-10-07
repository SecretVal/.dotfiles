{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            rust = ["rustfmt"];
            nix = ["alejandra"];
            lua = ["stylua"];
            json = ["jsonfmt"];
            go = ["gofumpt"];
            js = ["prettierd"];
            ts = ["prettierd"];
            kotlin = ["ktlint"];
          };
          default_format_opts = {
            lsp_format = "fallback";
          };
        };
      };
    };
  };
  home.packages = with pkgs; [
    gofumpt
    alejandra
    rustfmt
    stylua
    jsonfmt
    prettierd
    ktlint
  ];
}
