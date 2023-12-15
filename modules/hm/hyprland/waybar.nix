{config, pkgs, inputs,nix-colors, ...}: 
{
  imports = [ 
    inputs.nix-colors.homeManagerModules.default
  ];
  # Enable waybar
  programs.waybar = {
    enable = true;
    style = ''
    @define-color bg #${config.colorScheme.colors.base00};

    * {
      font-family: FontAwesome;
      font-size: 16px;
    }
    window#waybar {
      background-color: #${config.colorScheme.colors.base00};
      opacity: 0.9;
    }
    #workspaces  {
      color: #${config.colorScheme.colors.base05};
      padding: 0 5px;
      min-width: 20px;
    }
     #workspaces button.active {
       color: #${config.colorScheme.colors.base0D};
     }
     #workspaces button.urgent {
       color: #${config.colorScheme.colors.base08};
     }
     #workspaces button:hover {
       color: #${config.colorScheme.colors.base05};
       border: none;
     }
     #clock {
       color: #${config.colorScheme.colors.base05};
       padding: 0 5px;
       margin: 0px 5px;
     }
     #pulseaudio {
       color: #${config.colorScheme.colors.base05};
       padding: 0 5px;
       margin: 0px 5px;
     }
     #window {
       color: #${config.colorScheme.colors.base05};
       padding: 0 5px;
     }
     window#waybar.empty #window{
       background: none;
     }
     '';
     settings = {
       mainBar = {
         modules-left = ["hyprland/workspaces"];
         modules-right = [ "tray" "pulseaudio" "clock" ];
         modules-center = ["hyprland/window"];
         "pulseaudio" = {
           "on-click" = "pypr toggle pavu && hyprctl dispatch bringactivetotop";
         };
         "tray" = {
           "icon-size" = 21;
           "spacing" = 15;
         };
       };
     };
   };
 }
