{...}: {
  imports = [
    ./starship.nix
    ./zoxide.nix
    ./nnn.nix
  ];
  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
    };

    shellInit = ''
      set fish_greeting
    '';
  };
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = [
      "-la"
    ];
  };
}
