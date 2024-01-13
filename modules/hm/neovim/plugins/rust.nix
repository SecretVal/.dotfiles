{config, lib, ...}:{
  programs.nixvim = {
    plugins = {
      crates-nvim.enable = true;
      rust-tools = {
        enable = true;
        inlayHints = {
          auto = false;
        };
      };
    };
  };
}
