{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    prefix = "C-a";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha
          set -g @catppuccin_window_default_background ""#00FFFFFF""
        '';
      }
    ];
    extraConfig = ''
      set-option -g status-position top
    '';
  };
}
