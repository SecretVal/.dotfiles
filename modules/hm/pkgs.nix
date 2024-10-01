{pkgs, ...}: {
  #fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["Monaspace"];})
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
    krita
    libsForQt5.qt5.qtwayland
    jdk
    jetbrains.idea-community-bin
    glfw-wayland-minecraft
  ];
  programs.helix.enable = true;
}
