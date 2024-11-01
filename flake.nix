{
  description = "My NixOs Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    kix = {
      url = "github:secretval/kix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    overlays = [
    ];
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit overlays;
        };
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
        inputs.nur.hmModules.nur
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
