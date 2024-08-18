{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs:
      with epkgs; [
        evil
        evil-collection

        general
        projectile
        magit
        doom-modeline

        ivy
        swiper
        counsel
        hydra

        nix-mode
        lsp-mode
      ];
  };
}
