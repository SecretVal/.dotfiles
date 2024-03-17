{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  # Enable waybar
  programs.waybar = {
    enable = true;
    style =
      # css
      ''
        @define-color bg #${config.colorScheme.palette.base00};

        * {
          font-family: FontAwesome;
          font-size: 16px;
        }
        window#waybar {
          background-color: #${config.colorScheme.palette.base00};
          opacity: 0.9;
        }
        #workspaces  {
          color: #${config.colorScheme.palette.base05};
          padding: 0 5px;
          min-width: 20px;
        }
         #workspaces button.active {
           color: #${config.colorScheme.palette.base0D};
         }
         #workspaces button.urgent {
           color: #${config.colorScheme.palette.base08};
         }
         #workspaces button:hover {
           color: #${config.colorScheme.palette.base05};
           border: none;
         }
         #clock {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
           margin: 0px 5px;
         }
         #pulseaudio {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
           margin: 0px 5px;
         }
         #cpu {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
           margin: 0px 5px;
         }
         #memory {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
           margin: 0px 5px;
         }
         #window {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
         }
         window#waybar.empty #window{
           background: none;
         }
         #custom-power {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
           margin: 0px 5px;
         }
         #custom-power:hover {
           color: #${config.colorScheme.palette.base08};
           padding: 0 5px;
           margin: 0px 5px;
         }
         #custom-notification {
           color: #${config.colorScheme.palette.base05};
           padding: 0 5px;
           margin: 0px 5px;
         }
      '';
    settings = {
      mainBar = {
        modules-left = ["hyprland/workspaces"];
        modules-right = ["custom/notification" "tray" "cpu" "memory" "pulseaudio" "clock" "custom/power"];
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
            "default" = ["" "" ""];
          };

          "on-click" = "pavucontrol";
        };
        "tray" = {
          "icon-size" = 21;
          "spacing" = 15;
        };
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
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t";
          escape = true;
        };
      };
    };
  };
}
