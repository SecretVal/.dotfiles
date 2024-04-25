{pkgs, ...}: {
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    font-awesome
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    sl
    fzf
    tmux-sessionizer
    toipe
    watchexec
    nim2
    gcc
    fasm
  ];
}
