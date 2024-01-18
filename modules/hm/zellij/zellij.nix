{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      pane_frames = false;
      simplified_ui = true;
      default_layout = "compact";
      copy_command = "wl-cooy";
    };
  };
}
