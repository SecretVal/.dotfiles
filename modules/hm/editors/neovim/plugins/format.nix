{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        formattersByFt = {
          rust = ["rustfmt"];
          nix = ["alejandra"];
          lua = ["stylua"];
          json = ["jsonfmt"];
          go = ["gofumpt"];
          js = ["prettierd"];
          ts = ["prettierd"];
          kotlin = ["ktlint"];
        };
        settings.formatOnSave = {
          lspFallback = true;
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
