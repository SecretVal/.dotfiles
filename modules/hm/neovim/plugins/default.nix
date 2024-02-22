{ pkgs, ... }: {
  imports = [
    ./color.nix
    ./treesitter.nix
    ./telescope.nix
    ./harpoon.nix
    ./neorg.nix
    ./git.nix
    ./rust.nix
    ./image.nix
    ./lint.nix
    ./format.nix
    ./floaterm.nix
    ./mini.nix
    ./oil.nix
  ];
  programs.nixvim = {
    plugins = {
      # nvim-autopairs
      nvim-autopairs = {
        enable = true;
        checkTs = true;
      };
      comment-nvim.enable = true;
      todo-comments.enable = true;
      markdown-preview.enable = true;
      undotree.enable = true;
      rainbow-delimiters.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-just
    ];
  };
}
