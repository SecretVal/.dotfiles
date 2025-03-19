{...}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
      cd = "z";
      ci = "zi";
      nix-shell = "nix-shell --command fish";
    };

    
    shellInit = ''
      set fish_greeting
    '';
    shellInitLast = ''
      pokeget random --hide-name
    '';
  };
  programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    git = true;
    extraOptions = [
      "--all"
      "--long"
    ];
  };
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  programs.yazi.enable = true;
  programs.btop.enable = true;
  programs.lazygit.enable = true;
}
