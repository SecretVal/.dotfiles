{...}: {
  imports = [
    ./starship.nix
    ./nnn.nix
  ];
  programs.nushell = {
    enable = true;

    shellAliases = {
      cat = "bat";
      cd = "z";
      ci = "zi";
    };

    extraConfig = "
      $env.config = {
          show_banner: false,
      }
    ";
  };
  programs.carapace.enable = true;
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
}
