{
  description = "My NixOs Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    prism.url = "github:IogaMaster/prism";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    stylix,
    prism,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    overlays = [];
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations."lukas" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        stylix.homeManagerModules.stylix
        prism.homeModules.prism
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit nixvim;
        inherit inputs;
        inherit overlays;
      };
    };
  };
}
