{
  pkgs,
    flake-dir,
    inputs,
    ...
}: {
  stylix.enable = true;
  stylix.image = flake-dir + /bgs/Cloudsday.jpg;

  stylix.base16Scheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/scottmckendry/cyberdream.nvim/main/extras/base16/cyberdream.yaml";
    sha256 = "1bfi479g7v5cz41d2s0lbjlqmfzaah68cj1065zzsqksx3n63znf";
  };
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "JetBrainsMono Nerd Font Mono";
    package = pkgs.nerd-fonts.jetbrains-mono;
  };

  stylix.opacity.terminal = 0.8;
  stylix.opacity.applications = 0.8;
  stylix.opacity.desktop = 0.8;
  stylix.opacity.popups = 0.8;

  qt.enable = true;
}
