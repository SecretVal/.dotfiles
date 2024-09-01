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

    libresprite
    godot_4
    bear
    glfw-wayland
    glew
  ];
  programs.helix.enable = true;
}
