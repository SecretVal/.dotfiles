{...}: {
  programs.foot = {
    enable = false;
    settings = {
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
  programs.wezterm = {
    enable = true;
    extraConfig =
      # lua
      ''
        return {
          enable_wayland = false,
          hide_tab_bar_if_only_one_tab = true,
        }
      '';
  };
}
