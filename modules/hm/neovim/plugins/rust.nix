{ ... }: {
  programs.nixvim = {
    plugins = {
      crates-nvim.enable = true;
      rustaceanvim = {
        enable = true;
      };
    };
  };
}
