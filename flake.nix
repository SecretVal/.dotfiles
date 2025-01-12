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
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixvim,
    stylix,
    hyprland-qtutils,
    ghostty,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    flake-dir = ./.;
    overlays = [
    ];
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit overlays;
          inherit hyprland-qtutils;
          inherit flake-dir;
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
        inputs.nur.modules.homeManager.default
        ./home.nix
      ];
      extraSpecialArgs = {
        inherit nixvim;
        inherit inputs;
        inherit overlays;
        inherit ghostty;
        inherit flake-dir;
      };
    };
  };
}
