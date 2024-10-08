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
        gaps_in = 2.5;
        gaps_out = 5;
        border_size = 2;

        layout = "dwindle";
        resize_on_border = true;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        rounding = 5;
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 2;
          passes = 3;
          new_optimizations = true;
        };
      };
      # Credit: https://gitlab.com/Oglo12/hyprland-rice/
      animations = {
        enabled = true;

        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smooth, 0.5, 0, 0.99, 0.99"
          "snapback, 0.54, 0.42, 0.01, 1.34"
          "curve, 0.27, 0.7, 0.03, 0.99"
        ];
        animation = [
          "windows, 1, 5, overshot, slide"
          "windowsOut, 1, 5, snapback, slide"
          "windowsIn, 1, 5, snapback, slide"
          "windowsMove, 1, 5, snapback, slide"
          "border, 1, 5, default"
          "fade, 1, 5, default"
          "fadeDim, 1, 5, default"
          "workspaces, 1, 6, curve"
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
        "Super, RETURN, exec, foot"
        "Super, Q, killactive"
        "Super, M, exit"
        "Super, E, exec, foot -e yazi"
        "Super, F, togglefloating"
        "Super, P, pseudo"
        "Super shift, J, togglesplit"

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

        "Super SHIFT, 1, movetoworkspace, 1"
        "Super SHIFT, 2, movetoworkspace, 2"
        "Super SHIFT, 3, movetoworkspace, 3"
        "Super SHIFT, 4, movetoworkspace, 4"
        "Super SHIFT, 5, movetoworkspace, 5"
        "Super SHIFT, 6, movetoworkspace, 6"
        "Super SHIFT, 7, movetoworkspace, 7"
        "Super SHIFT, 8, movetoworkspace, 8"
        "Super SHIFT, 9, movetoworkspace, 9"
        "Super SHIFT, 0, movetoworkspace, 10"

        "Super, S, togglespecialworkspace, magic"
        "Super SHIFT, S, movetoworkspace, special:magic"
        "Super, mouse_down, workspace, e+1"
        "Super, mouse_up, workspace, e-1"

        "Super Shift ,F,fullscreen"
        "Super,D,exec, fuzzel -f 'JetBrainsMono Nerd Font Mono'-16"
        "Super,R,exec, ~/.dotfiles/scripts/waybar.sh"
        "Super,T,exec, grim ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
        "Super Shift,T,exec, slurp | grim -g - ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
        "Super ALT,T,exec, grim -o $(hyprctl activeworkspace | grep 'workspace ID' | tr ' ' '\\n' | tail --lines 1 | sed 's/:$//') ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')"
        "Super,z,exec, pypr zoom"
      ];

      bindm = [
        "Super, mouse:272, movewindow"
        "Super, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      layerrule = [
        # "blur, waybar"
        "blur, fuzzel"
        "blur, foot"
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
