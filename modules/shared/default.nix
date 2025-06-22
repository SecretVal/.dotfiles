{
  pkgs,
  flake-dir,
  ...
}: {
  stylix.enable = true;
  stylix.image = flake-dir + /bgs/mocha/koi.jpg;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "Maple Mono NF";
    package = pkgs.maple-mono.NF;
  };

  stylix.opacity.terminal = 0.8;
  stylix.opacity.applications = 0.8;
  stylix.opacity.desktop = 0.8;
  stylix.opacity.popups = 0.8;

  qt.enable = true;
}
