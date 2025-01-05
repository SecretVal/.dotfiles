{...}: {
  imports = [
    ./starship.nix
  ];
  programs.nushell = {
    enable = true;

    shellAliases = {
      cat = "bat";
      cd = "z";
      ci = "zi";
      nix-shell = "nix-shell --command nu";
    };

    extraConfig = "
      $env.config = {
          show_banner: false
          shell_integration: {
            osc2: false
            osc7: false
            osc8: false
            osc9_9: false
            osc133: false
            osc633: false
            reset_application_mode: false
          }
      }
      pokeget random --hide-name
      ";
  };
  programs.carapace.enable = true;
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  programs.yazi.enable = true;
  programs.btop.enable = true;
}
