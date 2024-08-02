{pkgs, ...}: {
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    font-awesome
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    sl
    fzf
    toipe
    watchexec
    nim2
    gcc
    fasm
    man
    wget
    file
    zig
    sesh
    discord-canary
    appimage-run
    pokeget-rs
  ];
}
