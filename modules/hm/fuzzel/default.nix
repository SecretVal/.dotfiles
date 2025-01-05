{ghostty, ...}: {
  programs.fuzzel = {
    enable = true;
    settings.main.terminal = "${ghostty.packages.x86_64-linux.default}/bin/ghostty";
  };
}
