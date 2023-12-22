{ pkgs }:
let
in
  pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "sddm";
      rev = "95bfcba80a3b0cb5d9a6fad422a28f11a5064991";
      sha256 = "19lbs0b4iv5cjxafgmb1b383r6cgchai2v15b8xv7k2409z33zi5";
    };
    installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    '';
  }


