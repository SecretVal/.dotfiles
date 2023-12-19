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
     #cpu {
       color: #${config.colorScheme.colors.base05};
       padding: 0 5px;
       margin: 0px 5px;
     }
     #memory {
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
     #custom-power {
       color: #${config.colorScheme.colors.base05};
       padding: 0 5px;
       margin: 0px 5px;
     }
     #custom-power:hover {
       color: #${config.colorScheme.colors.base08};
       padding: 0 5px;
       margin: 0px 5px;
     }
     '';
     settings = {
       mainBar = {
         modules-left = ["hyprland/workspaces"];
<<<<<<< Updated upstream
<<<<<<< Updated upstream
         modules-right = [ "tray" "cpu" "memory" "pulseaudio" "clock" "custom/power"];
=======
         modules-right = ["tray" "pulseaudio" "clock" ];
>>>>>>> Stashed changes
=======
         modules-right = ["tray" "pulseaudio" "clock" ];
>>>>>>> Stashed changes
         modules-center = ["hyprland/window"];
         "pulseaudio" = {
           "scroll-step" = 1;
           "format" = "{volume}% {icon}  {format_source}";
           "format-bluetooth" = "{volume}% {icon}  {format_source}";
           "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
           "format-muted" = "󰸈 {format_source}";
           "format-source" = "{volume}% ";
           "format-source-muted" = " ";
           "format-icons" = {
             "headphone" = "";
             "hands-free" = "";
             "headset" = "";
             "phone" = "";
             "portable" = "";
             "car" = "";
             "default" = [ "" "" "" ];
           };

           "on-click" = "pypr toggle pavu && hyprctl dispatch bringactivetotop";
         };
         "tray" = {
           "icon-size" = 21;
           "spacing" = 15;
         };
<<<<<<< Updated upstream
<<<<<<< Updated upstream
         "cpu" = {
           "format" = "{usage}% ";
         };
         "memory" = {
           "format" = "{percentage}% ";
         };
         "custom/power" = {
           "format" = "";
           "on-click" = "wlogout";
         };
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
       };
     };
   };
 }
