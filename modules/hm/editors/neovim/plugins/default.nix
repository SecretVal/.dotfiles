{pkgs, ...}: {
  imports = [
    ./treesitter.nix
    ./telescope.nix
    ./harpoon.nix
    ./neorg.nix
    ./lint.nix
    ./format.nix
    ./oil.nix
    ./color.nix

    ./snacks.nix
    ./mini.nix

    ./cmp.nix
    ./lsp.nix
  ];
  programs.nixvim = {
    plugins = {
      comment.enable = true;
      todo-comments.enable = true;
      undotree.enable = true;
      crates.enable = true;
      web-devicons.enable = true;
      image.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-just
    ];
  };
}
