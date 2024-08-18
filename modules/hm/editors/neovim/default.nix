{nixvim, ...}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    ./opt.nix
    ./lsp.nix
    ./plugins
    ./autoCmd.nix
    ./remaps.nix
    ./ftplugins.nix
    ./commands.nix
    ./cmp.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        nvimRuntime = true;
        plugins = true;
      };
    };
  };
}
