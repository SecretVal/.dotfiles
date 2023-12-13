{config, pkgs, ...}: {
  # Enable waybar
  programs.waybar = {
    enable = true;
    style = ''
    /*
    *
    * Catppuccin Macchiato palette
    * Maintainer: rubyowo
    *
    */

    @define-color base   #24273a;
    @define-color mantle #1e2030;
    @define-color crust  #181926;

    @define-color text     #cad3f5;
    @define-color subtext0 #a5adcb;
    @define-color subtext1 #b8c0e0;

    @define-color surface0 #363a4f;
    @define-color surface1 #494d64;
    @define-color surface2 #5b6078;

    @define-color overlay0 #6e738d;
    @define-color overlay1 #8087a2;
    @define-color overlay2 #939ab7;

    @define-color blue      #8aadf4;
    @define-color lavender  #b7bdf8;
    @define-color sapphire  #7dc4e4;
    @define-color sky       #91d7e3;
    @define-color teal      #8bd5ca;
    @define-color green     #a6da95;
    @define-color yellow    #eed49f;
    @define-color peach     #f5a97f;
    @define-color maroon    #ee99a0;
    @define-color red       #ed8796;
    @define-color mauve     #c6a0f6;
    @define-color pink      #f5bde6;
    @define-color flamingo  #f0c6c6;
    @define-color rosewater #f4dbd6;

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
      color: @text;
      padding: 0 5px;
      min-width: 20px;
    }
     #workspaces button.active {
       color: @blue;
     }
     #workspaces button.urgent {
       color: @red;
     }
     #clock {
       color: @text;
       padding: 0 5px;
     }
     #pulseaudio {
       color: @text;
       padding: 0 5px;
     }
     #window {
       color: @text;
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
