{
  pkgs,
  flake-dir,
  ...
}: {
  stylix.enable = true;
  stylix.image = flake-dir + /bgs/mocha/pixel-galaxy.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "JetBrains Mono";
    package = pkgs.jetbrains-mono;
  };

  stylix.opacity.terminal = 0.75;
  stylix.opacity.applications = 0.75;
  stylix.opacity.desktop = 0.75;
  stylix.opacity.popups = 0.75;

  qt.enable = true;
}
