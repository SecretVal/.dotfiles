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
        };
        formatOnSave = {
          lspFallback = true;
        };
      };
    };
  };
  home.packages = with pkgs; [
    alejandra
    rustfmt
    stylua
    jsonfmt
  ];
}
