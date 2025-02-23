{ghostty,input, ...}: {
  xdg.configFile."ghostty/custom.css" = {
    enable = true;
    text = builtins.readFile ./custom.css;
  };

  programs.ghostty = {
    enable = true;
    package = ghostty.packages.x86_64-linux.default;
    installVimSyntax = true;
    installBatSyntax = true;
    clearDefaultKeybinds = true;
    settings = {
      background-opacity = 0.8;
      cursor-opacity = 0.8;

      clipboard-read = "allow";
      clipboard-write = "allow";

      mouse-hide-while-typing = true;
      window-decoration = false;

      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      confirm-close-surface = false;

      gtk-single-instance = true;
      quit-after-last-window-closed = false;

      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;
      gtk-custom-css = "./custom.css";

      keybind = [
        "ctrl+shift+;=reload_config"
        "ctrl+shift+I=inspector:toggle"

        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"

        "ctrl+shift+2=new_split:down"
        "ctrl+shift+5=new_split:right"

        "alt+h=goto_split:left"
        "alt+j=goto_split:bottom"
        "alt+k=goto_split:top"
        "alt+l=goto_split:right"

        "ctrl+z=toggle_split_zoom"
        "ctrl+w=close_surface"

        "ctrl+t=new_tab"
        "alt+n=next_tab"
        "alt+p=previous_tab"
        "alt+tab=toggle_tab_overview"

        "alt+1=goto_tab:1"
        "alt+2=goto_tab:2"
        "alt+3=goto_tab:3"
        "alt+4=goto_tab:5"
        "alt+5=goto_tab:5"
        "alt+6=goto_tab:6"
        "alt+7=goto_tab:7"
        "alt+8=goto_tab:8"
        "alt+9=goto_tab:9"
        "alt+0=goto_tab:10"

        "ctrl+plus=increase_font_size:2"
        "ctrl+minus=decrease_font_size:2"
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
