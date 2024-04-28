{
  config,
  pkgs,
  nix-colors,
  lib,
  ...
}: {
  imports = [
    nix-colors.homeManagerModules.default
    ./waybar.nix
    ./swaylock.nix
  ];
  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    config = {
      modifier = "Mod4";
      input."*" = {
        xkb_layout = "de";
      };
      output.Virtual-1 = {
        mode = "1920x1080";
      };
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        lib.mkOptionDefault {
          "${modifier}+d" = "exec rofi -show drun";
        };
      window = {
        border = 0;
        titlebar = false;
      };
      gaps = {
        outer = 4;
        inner = 2;
      };
      bars = [
        {
          command = "waybar";
        }
      ];
    };
  };
  home.packages = with pkgs; [
    grim
    slurp
    swaynotificationcenter
    wlogout
    swaylock
    wl-clipboard
  ];
}
