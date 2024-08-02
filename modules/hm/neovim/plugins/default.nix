{pkgs, ...}: {
  imports = [
    ./color.nix
    ./treesitter.nix
    ./telescope.nix
    ./harpoon.nix
    ./neorg.nix
    ./git.nix
    ./image.nix
    ./lint.nix
    ./format.nix
    ./oil.nix
  ];
  programs.nixvim = {
    plugins = {
      comment.enable = true;
      todo-comments.enable = true;
      undotree.enable = true;
      crates-nvim.enable = true;
      startify = {
        enable = true;
        settings.change_to_dir = false;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-just
    ];
  };
}
