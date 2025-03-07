{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./bar.nix
    ./kanshi.nix
  ];
  wayland.windowManager.sway = {
    enable = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
    config = {
      window = {
        titlebar = false;
        hideEdgeBorders = "smart";
      };
      startup = [
        {
          always = true;
          command = "wl-copy";
        }
        {
          always = true;
          command = "ghostty --initial-window=false";
        }
        {
          always = true;
          command = "wl-copy";
        }
        {
          always = true;
          command = "kanshi";
        }
      ];
      bars = [
        {
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
          fonts = {
            names = ["FontAwesome" "JetBrainsMono"];
            style = "Bold";
            size = 10.0;
          };
        }
      ];
      gaps = {
        inner = 2;
        outer = 4;
      };

      input = {
        "*" = {
          xkb_layout = "de";
        };
      };

      modifier = "Mod4";
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
      in
        lib.mkOptionDefault {
          "${mod}+Return" = "exec ${config.programs.ghostty.package}/bin/ghostty";
          "${mod}+q" = "kill";
          "${mod}+d" = "exec fuzzel -f 'JetBrainsMono Nerd Font Mono'-16";
          "${mod}+v" = "exec cliphist list | fuzzel -d -f 'JetBrainsMono Nerd Font Mono'-16 | cliphist decode | wl-copy";
          "${mod}+t" = "exec grim ~/HDD/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')";
          "${mod}+shift+t" = "exec slurp | grim -g - ~/HDD/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')";
          "${mod}+shift+w" = "exec woomer";
        };
    };
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
