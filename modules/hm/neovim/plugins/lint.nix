{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lint = {
        enable = true;
        lintersByFt = {
          text = ["vale"];
          json = ["jsonlint"];
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
    nodePackages_latest.jsonlint
    ktlint
  ];
}
