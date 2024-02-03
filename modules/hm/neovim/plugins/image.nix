{ pkgs, ... }: {
  programs.nixvim = {
    plugins.image = {
      enable = true;
      backend = "ueberzug";
    };
  };
  home.packages = with pkgs; [
    ueberzugpp
    imagemagickBig
    (luajit.withPackages (ps: with ps; [ magick ]))
  ];
}
