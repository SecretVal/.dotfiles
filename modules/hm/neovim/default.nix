{
  inputs,
  system,
  ...
}: {
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.packages = [
    inputs.neovim-config.packages.${system}.default
  ];
}
