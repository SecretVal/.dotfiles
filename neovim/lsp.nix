{pkgs, config, nixvim, ...}:
{
  imports = [
    nixvim.homeManagerModules.nixvim 
  ];

  programs.nixvim = {
    lsp = {
      enable = true;
      servers = {
        rust-analyzer.enable = true;
        nixd.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        cssls.enable = true;
        cmake.enable = true;
        bashls.enable = true; 
      };
    };
  };
}
