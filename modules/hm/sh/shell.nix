{ ... }: {
  imports = [
    ./starship.nix
    ./nnn.nix
  ];
  programs.nushell = {
    enable = true;

    shellAliases = {
      cat = "bat";
    };

    extraConfig = "
    $env.config = {
      show_banner: false,
    }
    ";
  };
  programs.carapace.enable = true;
}
