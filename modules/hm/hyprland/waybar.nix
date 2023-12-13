{config, pkgs, nix-colors, ...}: {
  # Enable waybar
  programs.waybar = {
    enable = true;
    style = ''
    * {
      font-family: FontAwesome;
      font-size: 16px;
    }
    window#waybar {
      background: rgba(36, 39, 56, 0.75);
      border: none;
      border-radius: 20px;
    }
    #workspaces button {
      color: ${config.colorScheme.base00};
      padding: 0 5px;
      min-width: 20px;
    }
     #workspaces button.active {
       color: ${config.colorScheme.base0D};
     }
     #workspaces button.urgent {
       color: ${config.colorScheme.base08};
     }
     #clock {
       color: ${config.colorScheme.base05};
       padding: 0 5px;
     }
     #pulseaudio {
       color: ${config.colorScheme.base05};
       padding: 0 5px;
     }
     #window {
       color: ${config.colorScheme.base05};
       padding: 0 5px;
     }
     '';
     settings = {
       mainBar = {
         modules-left = ["hyprland/workspaces"];
         modules-right = ["pulseaudio" "clock"];
         modules-center = ["hyprland/window"];
         "pulseaudio" = {
           "on-click" = "pypr toggle pavu && hyprctl dispatch bringactivetotop";
         };
       };
     };
   };
 }
