{...}: {
  programs.zellij.enable = true;
  home.file.zellij = {
    target = ".config/zellij/config.kdl";
    text = ''
      theme "catppuccin-mocha"
      pane_frames false
      default_layout "disable-status-bar"
      simplified_ui true
      default_layout "compact"
      copy_command "wl-copy"
    '';
  };
}
