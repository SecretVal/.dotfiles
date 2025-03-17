{...}: {
  # Enable waybar
  programs.waybar = {
    enable = true;
    style =
      # css
      ''
        * {
          font-family: JetBrainsMono Nerd Font, monospace;
          font-size: 15px;
          font-weight: bold;
          border: none;
          border-radius: 0;
        }

        window#waybar {
          background: transparent;
          opacity: 0.8;
        }

        window#waybar.empty #window{
          background: none;
        }

        #custom-power {
          padding: 0px 5px;
          margin: 0px 5px;
        }

        #custom-power:hover {
          padding: 0px 5px;
          margin: 0px 5px;
        }

        #custom-notification {
          padding: 0px 5px;
          margin: 0px 5px;
        }
      '';
    settings = {
      mainBar = {
        position = "top";

        modules-left = ["hyprland/workspaces"];
        modules-right = ["custom/notification" "tray" "cpu" "memory" "pulseaudio" "clock" "custom/power"];
        modules-center = ["hyprland/window"];
        "hyprland/workspaces" = {
          format = "{icon}";
        };

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
