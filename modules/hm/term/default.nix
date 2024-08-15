{...}: {
  programs.wezterm = {
    enable = true;
    extraConfig =
      # lua
      ''
        return {
          enable_wayland = false,
          hide_tab_bar_if_only_one_tab = true,
          use_fancy_tab_bar = false,
          tab_bar_at_bottom = true,
          freetype_load_target = "HorizontalLcd",
          window_padding = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0,
          },
          -- "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'",
          harfbuzz_features = {
            "calt",
            "ss01",
            "ss02",
            "ss03",
            "ss04",
            "ss05",
            "ss06",
            "ss07",
            "ss08",
            "ss09",
            "liga",
          },
          leader = {
            key = "a",
            mods = "CTRL",
            timeout_milliseconds = math.maxinteger,
          },
          keys = {
            {
              key = "a",
              mods = "LEADER|CTRL",
              action = wezterm.action.SendKey({
                key = "a",
                mods = "CTRL",
              })
            },
            {
              key = "c",
              mods = "LEADER",
              action = wezterm.action.SpawnTab("CurrentPaneDomain")
            },
            {
              key = "s",
              mods = "LEADER",
              action = wezterm.action.SplitVertical({domain="CurrentPaneDomain"})
            },
            {
              key = "v",
              mods = "LEADER",
              action = wezterm.action.SplitHorizontal({domain="CurrentPaneDomain"})
            },
            {
              key = "h",
              mods = "LEADER",
              action = wezterm.action.ActivatePaneDirection("Left")
            },
            {
              key = "j",
              mods = "LEADER",
              action = wezterm.action.ActivatePaneDirection("Down")
            },
            {
              key = "k",
              mods = "LEADER",
              action = wezterm.action.ActivatePaneDirection("Up")
            },
            {
              key = "l",
              mods = "LEADER",
              action = wezterm.action.ActivatePaneDirection("Right")
            },
          }
        }
      '';
  };
}
