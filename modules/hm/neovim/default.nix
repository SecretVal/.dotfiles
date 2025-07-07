{
  inputs,
  system,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.packages = with pkgs; [
    inputs.neovim-config.packages.${system}.default

    (typst.withPackages (
      p:
        with p; [
          cetz # drawing
          codly # code
          fletcher # diagrams
          frame-it #frames
          hydra # headings
          pinit # pining
          touying # slides
        ]
    ))
  ];
}
