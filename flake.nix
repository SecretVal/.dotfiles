{
  description = "My NixOs Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";

    kix = {
      url = "github:secretval/kix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-config = {
      url = "github:secretval/.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    musnix = {url = "github:musnix/musnix";};
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
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
          inputs.musnix.nixosModules.musnix
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
        inherit inputs;
        inherit overlays;
        inherit ghostty;
        inherit flake-dir;
        inherit system;
      };
    };
  };
}
