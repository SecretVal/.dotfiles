{
  pkgs,
  flake-dir,
  ...
}: {
  stylix.enable = true;
  stylix.image = flake-dir + /bgs/Cloudsday.jpg;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "Departure Mono Nerd Font";
    package = pkgs.nerd-fonts.departure-mono;
  };

  qt.enable = true;
}
