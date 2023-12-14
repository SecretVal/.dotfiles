{config, pkgs, inputs, ...}: 
{
  # Enable waybar
  programs.waybar = {
    enable = true;
    style = ''
    @define-color bg #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base00};
    * {
      font-family: FontAwesome;
      font-size: 16px;
      border: none;
      border-radius: 16px;
    }
    window#waybar {
      background-color: rgba(0,0,0,0);
      background: transparent;
    }
    #workspaces  {
      background: @bg;
      color: #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base05};
      padding: 0 5px;
      min-width: 20px;
    }
     #workspaces button.active {
       color: #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base0D};
     }
     #workspaces button.urgent {
       color: #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base08};
     }
     #clock {
       background-color: @bg;
       color: #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base05};
       padding: 0 5px;
       margin: 0px 5px;
     }
     #pulseaudio {
       background-color: @bg;
       color: #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base05};
       padding: 0 5px;
       margin: 0px 5px;
     }
     #window {
       background-color: @bg;
       color: #${inputs.nix-colors.colorSchemes.catppuccin-mocha.colors.base05};
       padding: 0 5px;
     }
     window#waybar.empty #window{
       background: none;
     }
     '';
     settings = {
       mainBar = {
         modules-left = ["hyprland/workspaces"];
         modules-right = ["group/right"];
         modules-center = ["hyprland/window"];
         "pulseaudio" = {
           "on-click" = "pypr toggle pavu && hyprctl dispatch bringactivetotop";
         };
         "group/right" = {
           orientation = "horizontal";
           modules = ["custom/swaync" "pulseaudio" "clock"];
         };
         "custom/bell" = {
           "format" = "";
         };
       };
     };
   };
 }
