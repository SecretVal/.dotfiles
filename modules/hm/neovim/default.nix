{
  inputs,
  system,
  ...
}: {
  home.shellAliases = {
    "vim" = "nvim";
    "vi" = "nvim";
    "v" = "nvim";
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.packages = [
    inputs.neovim-config.packages.${system}.default
  ];
}
