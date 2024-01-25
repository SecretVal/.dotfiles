{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      lint = {
        enable = true;
        lintersByFt = {
          text = ["vale"];
          json = ["jsonlint"];
          markdown = ["vale"];
        };
      };
    };
  };
  home.packages = with pkgs; [
    vale
    nodePackages_latest.jsonlint
  ];
}
