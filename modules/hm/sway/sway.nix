{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./waybar.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    swaynotificationcenter
    wlogout
    swaylock
    wl-clipboard
  ];
}
