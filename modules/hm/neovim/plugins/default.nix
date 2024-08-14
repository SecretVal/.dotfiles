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
      nvim-autopairs.enable = true;
      todo-comments.enable = true;
      undotree.enable = true;
      crates-nvim.enable = true;
      lualine = {
        enable = true;
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-just
    ];
  };
}
