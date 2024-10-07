{...}: {
  imports = [
    ./starship.nix
  ];
  programs.bash = {
    enable = true;

    shellAliases = {
      cat = "bat";
      cd = "z";
      ci = "zi";
      ls = "eza";
    };

    bashrcExtra = ''
      pokeget --hide-name random
    '';
  };
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  programs.yazi.enable = true;
  programs.cava.enable = true;
  programs.btop.enable = true;
  programs.eza = {
    enable = true;
    extraOptions = [
      "--long"
      "--all"
    ];
    icons = true;
    git = true;
  };
}
