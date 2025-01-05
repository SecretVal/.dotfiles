{pkgs, ...}: {
  stylix.enable = true;
  stylix.image = /home/lukas/.dotfiles/bgs/gruvbox/Clearday.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "JetBrainsMono Nerd Font Mono";
    package = pkgs.nerd-fonts.jetbrains-mono;
  };

  stylix.targets.nixvim.enable = false;

  qt.enable = true;
}
