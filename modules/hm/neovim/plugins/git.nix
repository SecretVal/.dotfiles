{...}: {
  programs.nixvim = {
    plugins = {
      # git
      git-worktree = {
        enable = true;
        enableTelescope = true;
      };
      fugitive.enable = true;
      gitsigns = {
        enable = true;
      };
    };
  };
}
