{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    settings = {
      exec-once = [
        "waybar"
        "swaync"
        "wl-copy"
      ];

      input = {
        kb_layout = "de";
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat";
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;

        layout = "dwindle";
        resize_on_border = true;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        rounding = 0;
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          xray = true;
          new_optimizations = true;
        };
      };
      animations = {
        enabled = true;

        # Define Settings For Animation Bezier Curve
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "false";
      };

      misc = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
      };

      bind = [
        "Super, RETURN, exec, wezterm"
        "Super, Q, killactive,"
        "Super, M, exit,"
        "Super, E, exec, foot -e yazi"
        "Super, V, togglefloating,"
        "Super, P, pseudo, # dwindle"
        "Super shift, J, togglesplit, # dwindle"

        "Super, h, movefocus, l"
        "Super, l, movefocus, r"
        "Super, k, movefocus, u"
        "Super, j, movefocus, d"

        "Super, 1, workspace, 1"
        "Super, 2, workspace, 2"
        "Super, 3, workspace, 3"
        "Super, 4, workspace, 4"
        "Super, 5, workspace, 5"
        "Super, 6, workspace, 6"
        "Super, 7, workspace, 7"
        "Super, 8, workspace, 8"
        "Super, 9, workspace, 9"
        "Super, 0, workspace, 10"

        "Super SHIFT, 1, movetoworkspacesilent, 1"
        "Super SHIFT, 2, movetoworkspacesilent, 2"
        "Super SHIFT, 3, movetoworkspacesilent, 3"
        "Super SHIFT, 4, movetoworkspacesilent, 4"
        "Super SHIFT, 5, movetoworkspacesilent, 5"
        "Super SHIFT, 6, movetoworkspacesilent, 6"
        "Super SHIFT, 7, movetoworkspacesilent, 7"
        "Super SHIFT, 8, movetoworkspacesilent, 8"
        "Super SHIFT, 9, movetoworkspacesilent, 9"
        "Super SHIFT, 0, movetoworkspacesilent, 10"

        "Super, S, togglespecialworkspace, magic"
        "Super SHIFT, S, movetoworkspace, special:magic"
        "Super, mouse_down, workspace, e+1"
        "Super, mouse_up, workspace, e-1"

        "bind = Super,F,fullscreen"
        "bind = Super,D,exec, fuzzel -f 'DejaVu Sans'-16"
        "bind = Super,R,exec, ~/.dotfiles/scripts/waybar.sh"
        "bind = Super,T,exec, grim ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
        "bind = Super Shift,T,exec, slurp | grim -g - ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
        "bind = Super,z,exec, pypr zoom"
      ];

      bindm = [
        "Super, mouse:272, movewindow"
        "Super, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      layerrule = [
        "blur, waybar"
        "blur, fuzzel"
      ];
    };
  };

  home.packages = with pkgs; [
    grim
    slurp
    swaynotificationcenter
    wlogout
    wl-clipboard
  ];
  programs.hyprlock.enable = true;
}
