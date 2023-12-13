{config, lib, pkgs, stylix, ...}:
{
  imports = [
    stylix.nixosModules.stylix
  ];
  stylix.image = ~/.dotfiles/bgs/wallpaper.png;
}
