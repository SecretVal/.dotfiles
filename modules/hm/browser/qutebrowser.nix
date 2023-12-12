{config, pkgs, lib, ...}:
{
  home.packages = with pkgs [
    qt6.qtwayland
  ];
  programs.qutebrowser.enable = true;
}
