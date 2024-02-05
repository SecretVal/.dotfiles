{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    terminal = "xterm-256color";
    prefix = "C-a";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_middle_separator "█"
          set -g @catppuccin_window_right_separator "█"

          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"
        '';
      }
    ];
    extraConfig = ''
      set-option -a terminal-overrides ",*256col*:RGB"
      set -g default-terminal "screen-256color"

      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set -g status-style bg=default 
      set-option -g status-position top

      # VIM
      set -g status-keys vi
      setw -g mode-keys vi
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      unbind t
      bind t display-popup -E "tms"
    '';
  };
}
