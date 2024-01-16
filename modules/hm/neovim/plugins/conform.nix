{
  conig,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        formattersByFt = {
          rust = ["rustfmt"];
          nix = ["alejandra"];
        };
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 50;
        };
      };
    };
  };
}
