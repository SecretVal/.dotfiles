{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        formattersByFt = {
          rust = [ "rustfmt" ];
          nix = [ "nixpkgs_fmt" ];
          lua = [ "stylua" ];
          json = [ "jsonfmt" ];
          go = [ "gofumpt" ];
          js = [ "prettierd" ];
          ts = [ "prettierd" ];
        };
        formatOnSave = {
          lspFallback = true;
        };
      };
    };
  };
  home.packages = with pkgs; [
    gofumpt
    nixpkgs-fmt
    rustfmt
    stylua
    jsonfmt
    prettierd
  ];
}
