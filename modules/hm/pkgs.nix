{pkgs, ...}: {
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    font-awesome

    sl
    fzf
    typioca
    watchexec
    man
    wget
    file
    sesh
    discord-canary
    appimage-run
    pokeget-rs
    prismlauncher
    via
    xonotic

    zig
    jdk
    gcc
    fasm
    # aseprite
    godot_4
  ];
  programs.qutebrowser.enable = true;
}
