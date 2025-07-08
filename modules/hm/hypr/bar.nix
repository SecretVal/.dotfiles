{
  lib,
  pkgs,
  stylix,
  config,
  ...
}: {
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
    style = ''
        @define-color base00 #${config.stylix.generated.palette.base00};  @define-color base01 #${config.stylix.generated.palette.base01};
        @define-color base02 #${config.stylix.generated.palette.base02};  @define-color base03 #${config.stylix.generated.palette.base03};
        @define-color base04 #${config.stylix.generated.palette.base04};  @define-color base05 #${config.stylix.generated.palette.base05};
        @define-color base06 #${config.stylix.generated.palette.base06};  @define-color base07 #${config.stylix.generated.palette.base07};

        @define-color base08 #${config.stylix.generated.palette.base08};  @define-color base09 #${config.stylix.generated.palette.base09};
        @define-color base0A #${config.stylix.generated.palette.base0A};  @define-color base0B #${config.stylix.generated.palette.base0B};
        @define-color base0C #${config.stylix.generated.palette.base0C};  @define-color base0D #${config.stylix.generated.palette.base0D};
        @define-color base0E #${config.stylix.generated.palette.base0E};  @define-color base0F #${config.stylix.generated.palette.base0F};

        * {
          font-family: JetBrainsMono Nerd Font Propo;
          font-size: 15px;
          font-weight: bold;
        }

        window#waybar {
          border-radius: 0.6rem;
          border: 2px solid @base06;
          background: alpha(@base00, 0.5);
        }

        window#waybar.empty #window{
          background: none;
        }


        #workspaces {
          background: transparent;
          margin: 5px 10px;
          padding: 0px 0px;
          border-radius: 15px;
        }

        #workspaces button {
          background: @base02;
          color: @base04;
          border: none;
          border-radius: 8px;
          min-width: 15px;
          margin: 2px 3px;
          padding: 4px 8px;
          transition: background-color 0.3s ease, color 0.3s ease, padding 0.3s ease, min-width 0.3s ease;
        }

        #workspaces button.active {
          background: @base05;
          color: @base00;
          box-shadow: 0 2px 8px @base01;
          padding: 4px 8px;
          min-width: 25px;
        }


        #workspaces button:hover {
          background: @base03;
          color: @base05;
        }

        #workspaces button.occupied {
          background: @base02;
          color: @base05;
        }
        
        #workspaces button.urgent {
          background: @base08;
          color: @base00;
        }
        
        #custom-power {
          padding: 5px 8px;
          margin:  5px 5px;
        }

        #custom-notification {
          padding: 5px 8px;
          margin:  5px 5px;
        }
    '';
    settings = {
      mainBar = {
        margin = "5 10 0 10";
        position = "top";
        height = 42;

        modules-left = ["hyprland/workspaces" "wlr/taskbar"];
        modules-center = ["hyprland/window"];
        modules-right = ["custom/notification" "tray" "cpu" "memory" "pulseaudio" "clock" "custom/power"];

        "hyprland/workspaces" = {
          "format" = "{name}";
          "format-icons" = {
            "active" = "{name}";
            "default" = "";
          };
          "on-click" = "activate";
          "sort-by-number" = true;
          "active-only" = false;
        };

        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{volume}% {icon}  {format_source}";
          "format-bluetooth" = "{volume}% {icon}  {format_source}";
          "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
          "format-muted" = "󰸈 {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = " ";
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
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
