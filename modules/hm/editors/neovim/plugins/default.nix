{pkgs, ...}: {
  imports = [
    ./treesitter.nix
    ./telescope.nix
    ./harpoon.nix
    ./neorg.nix
    ./git.nix
    ./lint.nix
    ./format.nix
    ./oil.nix
    ./color.nix
    ./zen.nix
    ./alpha.nix

    ./cmp.nix
    ./lsp.nix
  ];
  programs.nixvim = {
    plugins = {
      comment.enable = true;
      todo-comments.enable = true;
      undotree.enable = true;
      crates-nvim.enable = true;
      web-devicons.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-just
    ];
  };
}
