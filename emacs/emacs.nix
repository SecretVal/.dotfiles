# Emacs is my main driver. I'm the author of Doom Emacs
# https://github.com/hlissner/doom-emacs. This module sets it up to meet my
# particular Doomy needs.

{ config, lib, pkgs, inputs, ... }:
{
    programs.emacs = {
        enable = true;
        package = pkgs.emacs29;
    };

    xdg.configFile."doom".source = ./doom;
    home.packages = with pkgs; [
        nil
        ## Doom dependencies
        git
        (ripgrep.override {withPCRE2 = true;})
        gnutls              # for TLS connectivity
        # multimarkdown
        multimarkdown
    ];
}
