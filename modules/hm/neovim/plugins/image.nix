{pkgs, ...}: {
  programs.nixvim = {
    plugins.image = {
      enable = false;
      backend = "ueberzug";
    };
  };
  home.packages = with pkgs; [
    ueberzugpp
    imagemagickBig
    (luajit.withPackages (ps: with ps; [magick]))
  ];
}
