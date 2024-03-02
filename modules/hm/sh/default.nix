{...}: {
  imports = [
    ./starship.nix
    ./zoxide.nix
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
}
