{pkgs, config,lib, ...}:
{
    xsession.windowManager.i3 = {
        enable = true;
        config = {
            modifier = "Mod1";
            terminal = "alacritty";
            window = {
                border = 1;
                titlebar = false;
            };
            startup = [
                { command = "picom &"; }
                { command = "nitrogen --restore &"; }
                { command = "emacs --daemon"; always=true;}
            ];
            keybindings = let 
                modifier = config.xsession.windowManager.i3.config.modifier;
            in lib.mkOptionDefault{
#                "${modifier}+d" = "exec rofi -show run";
            };
        };
    };
}
