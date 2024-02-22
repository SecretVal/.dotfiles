{ nixvim, ... }: {
  imports = [
    nixvim.homeManagerModules.nixvim
    ./opt.nix
    ./cmp.nix
    ./lsp.nix
    ./plugins
    ./autoCmd.nix
    ./remaps.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    highlight.ExtraWhitespace.bg = "red";
    match.ExtraWhitespace = "\\s\\+$";
  };
}
