{pkgs, ...}: {
  stylix.enable = true;
  stylix.image = /home/lukas/.dotfiles/bgs/gruvbox.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "Monaspace Radon";
    package = pkgs.monaspace;
  };

  stylix.targets.nixvim.enable = false;
}
