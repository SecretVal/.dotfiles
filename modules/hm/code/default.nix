{pkgs, ...}: {
  home.packages = with pkgs; [
    odin
    zig
    jdk
    gcc
    fasm
    node
  ];
}
