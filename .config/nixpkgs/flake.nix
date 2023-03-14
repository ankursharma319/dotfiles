# Run as:
# cd ~/.config/nixpkgs && nix run . switch -- --flake .

{
  description = "Home Manager configuration of Ankur";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations.ankurs4 = home-manager.lib.homeManagerConfiguration {
      # pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      # below is same as legacyPackages above but with allowUnfree
      pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
      };
      modules = [
        ./home.nix
      ];
    };
  };
}