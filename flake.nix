{
  description = "My NixOs Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #rust-overlay.url = "github:oxalica/rust-overlay";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nixvim,nix-colors, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    user = "lukas";
  in  {
    nixosConfigurations =  {
      nixos = lib.nixosSystem {
        modules = [
          ./configuration.nix 
#          ({ pkgs, ... }: {
#            nixpkgs.overlays = [ rust-overlay.overlays.default ];
#            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
#          })
        ];
      };
    };
    homeConfigurations."lukas" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit nixvim;
        inherit inputs;
        inherit nix-colors;
      };
    };
  };
}
