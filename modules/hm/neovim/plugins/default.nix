{...}: {
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
    ./oil.nix
  ];
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      #nvim-autopairs
      nvim-autopairs = {
        enable = true;
        checkTs = true;
      };
      comment-nvim.enable = true;
      markdown-preview.enable = true;
      undotree.enable = true;
      rainbow-delimiters.enable = true;
    };
  };
}
