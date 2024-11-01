{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lint = {
        enable = true;
        lintersByFt = {
          text = ["vale"];
          # json = ["jsonlint"];
          markdown = ["vale"];
          go = ["golangcilint"];
          nix = ["nix"];
          kotlin = ["ktlint"];
        };
      };
    };
  };
  home.packages = with pkgs; [
    vale
    golangci-lint
    # FIX: Is broken until https://github.com/NixOS/nixpkgs/pull/349783
    # nodePackages_latest.jsonlint
    ktlint
  ];
}
