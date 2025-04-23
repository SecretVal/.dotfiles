{...}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
      cd = "z";
      ci = "zi";
    };

    bashrcExtra = ''
      pokeget random --hide-name
    '';
  };

  programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    git = true;
    extraOptions = [
      "-lah"
    ];
  };

  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  programs.yazi.enable = true;
  programs.btop.enable = true;
  programs.lazygit.enable = true;
}
