{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    clock24 = true;
    terminal = "screen-256color";
    escapeTime = 0;
    baseIndex = 1;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavor 'mocha'";
      }
    ];
    extraConfig = ''
      bind-key C-a send-prefix
      set-option -g renumber-windows on
      set-option -g status-position top

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      bind -r D neww -c "#{pane_current_path}" "[[ -e TODO.md ]] && nvim TODO.md || nvim ~/.dotfiles/personal/todo.md"

      # forget the find window.  That is for chumps
      bind-key -r f run-shell "tmux neww 'sesh connect (sesh list | fzf)'"
    '';
  };
  home.packages = with pkgs; [
    sesh
  ];
}
