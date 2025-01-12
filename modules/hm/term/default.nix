{ghostty, ...}: {
  programs.ghostty = {
    enable = true;
    package = ghostty.packages.x86_64-linux.default;
    installVimSyntax = true;
    installBatSyntax = true;
    clearDefaultKeybinds = true;
    settings = {
      cursor-opacity = 0.8;

      clipboard-read = "allow";
      clipboard-write = "allow";

      mouse-hide-while-typing = true;
      window-decoration = false;

      cursor-style = "block";
      cursor-style-blink = false;

      confirm-close-surface = false;

      gtk-single-instance = true;
      quit-after-last-window-closed = false;

      keybind = [
        "ctrl+shift+;=reload_config"
        "ctrl+shift+I=inspector:toggle"

        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        "ctrl+a>s=new_split:down"
        "ctrl+a>v=new_split:right"
        "ctrl+a>h=goto_split:left"
        "ctrl+a>j=goto_split:bottom"
        "ctrl+a>k=goto_split:top"
        "ctrl+a>l=goto_split:right"

        "ctrl+a>z=toggle_split_zoom"
        "ctrl+a>x=close_surface"

        "ctrl+a>c=new_tab"

        "ctrl+a>1=goto_tab:1"
        "ctrl+a>2=goto_tab:2"
        "ctrl+a>3=goto_tab:3"
        "ctrl+a>4=goto_tab:5"
        "ctrl+a>5=goto_tab:5"
        "ctrl+a>6=goto_tab:6"
        "ctrl+a>7=goto_tab:7"
        "ctrl+a>8=goto_tab:8"
        "ctrl+a>9=goto_tab:9"
        "ctrl+a>0=goto_tab:10"

        "ctrl+a>n=next_tab"
        "ctrl+a>p=previous_tab"
      ];
    };
  };
  programs.foot = {
    enable = true;
    settings = {
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
