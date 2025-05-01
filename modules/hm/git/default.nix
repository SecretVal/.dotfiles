{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userEmail = "108518296+SecretVal@users.noreply.github.com";
    userName = "secretval";
    extraConfig.credentials = {
      "https://github.com".helper = "!/home/lukas/.nix-profile/bin/gh auth git-credential";
      "https://gist.github.com".helper = "!/home/lukas/.nix-profile/bin/gh auth git-credential";
    };
  };
}
