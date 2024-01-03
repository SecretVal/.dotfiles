{config, lib, nixvim,...}:
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
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
