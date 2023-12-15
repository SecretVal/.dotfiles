{ pkgs }:

let
  imgLink = "https://github.com/Gingeh/wallpapers/blob/main/landscapes/evening-sky.png";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-VuvI2HUjxxU2QgjjU3ire4fMOWU3NsL8ZvXDZOBYbog=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "sha256-Jf4xfgJEzLM7WiVsERVkj5k80Fhh1edUl6zsSBbQi6Y=";
    sha256 = "19lbs0b4iv5cjxafgmb1b383r6cgchai2v15b8xv7k2409z33zi5";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
    '';
}
