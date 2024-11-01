{pkgs, ...}: {
  stylix.enable = true;
  stylix.image = /home/lukas/.dotfiles/bgs/gruvbox/Clearday.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 16;

  stylix.fonts.monospace = {
    name = "JetBrainsMono Nerd Font Mono";
    package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
  };

  # stylix.opacity.terminal = 0.8;
  # stylix.opacity.applications = 0.8;
  # stylix.opacity.desktop = 0.8;
  # stylix.opacity.popups = 0.8;

  stylix.targets.nixvim.enable = false;
}
