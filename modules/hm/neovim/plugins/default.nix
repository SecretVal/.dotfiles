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
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-just
    ];
  };
}
