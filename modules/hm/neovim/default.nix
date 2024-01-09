{config, lib, nixvim,pkgs,...}:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./opt.nix
    ./cmp.nix
    ./lsp.nix
    ./opt.nix
    ./color.nix
    ./plugins.nix
    ./telescope.nix
    ./startify.nix
    ./autoCmd.nix
    ./remaps.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
