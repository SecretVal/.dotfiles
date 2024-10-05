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
    xdg-desktop-portal-hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/xdg-desktop-portal-hyprland";
      submodules = true;
    };
    hyprpaper = {
      type = "git";
      url = "https://github.com/hyprwm/hyprpaper";
      submodules = true;
    };
    hyprwayland-scanner = {
      type = "git";
      url = "https://github.com/hyprwm/hyprwayland-scanner";
      submodules = true;
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
      inputs.xdg-desktop-portal-hyprland.overlays.xdg-desktop-portal-hyprland
      inputs.hyprpaper.overlays.default
      inputs.hyprwayland-scanner.overlays.default
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
