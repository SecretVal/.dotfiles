{pkgs, ...}: {
  stylix.enable = true;
  stylix.image = ./background-anime.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.polarity = "dark";
}
