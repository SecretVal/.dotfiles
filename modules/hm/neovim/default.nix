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
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
