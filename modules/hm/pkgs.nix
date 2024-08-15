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
    jetbrains.idea-community-bin
    xonotic

    gleam
    erlang
    rebar3

    nim2
    zig
    jdk
    kotlin
    gradle
    gcc
    fasm
  ];
}
