{ config, lib, pkgs,inputs, nix-colors, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./waybar.nix
    ./swaylock.nix
  ];
  wayland.windowManager.hyprland = { 
    enable = true; 
    settings = { }; 
    xwayland = {
      enable = true; 
    };
    extraConfig = '' 
monitor=,1920x1080,auto,1


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
# exec-once = waybar & hyprpaper & firefox

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24

exec-once=waybar 
exec-once=pypr
exec-once=swww init
exec=swww img ~/.dotfiles/bgs/unicat.png
exec-once=swaync
exec-once=wl-copy

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
  kb_layout = de
  follow_mouse = 1
  sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
  accel_profile = flat
}
general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    gaps_in = 4
    gaps_out = 8
    border_size = 3
    col.active_border = rgb(${config.colorScheme.colors.base0E})
    col.inactive_border = rgba(595959aa)

    layout = dwindle
    resize_on_border = true

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false
    cursor_inactive_timeout = 5 # Hyprland uses seconds
}
decoration {
  rounding = 10
  drop_shadow = false
  blur {
    enabled = true
    size = 0
    passes = 0
    new_optimizations = on
  }
}
animations {
  enabled = yes

  # Define Settings For Animation Bezier Curve
  bezier = wind, 0.05, 0.9, 0.1, 1.05
  bezier = winIn, 0.1, 1.1, 0.1, 1.1
  bezier = winOut, 0.3, -0.3, 0, 1
  bezier = liner, 1, 1, 1, 1

  animation = windows, 1, 6, wind, slide
  animation = windowsIn, 1, 6, winIn, slide
  animation = windowsOut, 1, 5, winOut, slide
  animation = windowsMove, 1, 5, wind, slide
  animation = border, 1, 1, liner
  animation = borderangle, 1, 30, liner, loop
  animation = fade, 1, 10, default
  animation = workspaces, 1, 5, wind
}

dwindle {
  pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
  preserve_split = true # you probably want this
}

master {
  new_is_master = true
}


gestures {
  # See https://wiki.hyprland.org/Configuring/Variables/ for more
  workspace_swipe = off
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

$scratchpadsize = size 80% 85%
$scratchpad = class:^(scratchpad)$
windowrulev2 = float,$scratchpad
windowrulev2 = $scratchpadsize,$scratchpad
windowrulev2 = workspace special silent,$scratchpad
windowrulev2 = center,$scratchpad

$pavucontrol = class:^(pavucontrol)$
windowrulev2 = float,$pavucontrol
windowrulev2 = size 86% 40%,$pavucontrol
windowrulev2 = move 50% 6%,$pavucontrol
windowrulev2 = workspace special silent,$pavucontrol
windowrulev2 = opacity 0.80,$pavucontrol
layerrule = blur,waybar

# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, RETURN, exec, foot
bind = $mainMod, Q, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, thunar
bind = $mainMod, V, togglefloating, 
bind = $mainMod, R, exec, wofi --show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bind = $mainMod,F,fullscreen
bind = $mainMod,D,exec, rofi -show drun
bind = $mainMod,R,exec, ~/.dotfiles/scripts/waybar.sh
bind = $mainMod,T,exec, slurp | grim -g - ~/Bilder/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')
bind = $mainMod,z,exec, pypr zoom
'';
  };
  home.packages = with pkgs;[
    grim
    slurp
    swaynotificationcenter
    wlogout
    swaylock
    wl-clipboard
    (python3Packages.buildPythonPackage rec {
      pname = "pyprland";
      version = "1.4.1";
      src = pkgs.fetchPypi {
        inherit pname version;
        sha256 = "sha256-JRxUn4uibkl9tyOe68YuHuJKwtJS//Pmi16el5gL9n8=";
      };
      format = "pyproject";
      propagatedBuildInputs = with pkgs; [
        python3Packages.setuptools
        python3Packages.poetry-core
        poetry
      ];
      doCheck = false;
    })
  ];
  home.file.".config/hypr/pyprland.json".text = ''
  {
    "pyprland": {
      "plugins": ["scratchpads", "magnify"]
    },
    "scratchpads": {
      "pavu": {
        "command": "pavucontrol",
        "margin": 50,
        "unfocus": "hide",
        "animation": "fromTop"
      }
    }
  }
  '';

}
