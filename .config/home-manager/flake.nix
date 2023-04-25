# Run as:
# cd ~/.config/home-manager && nix run . switch -- --flake .
# nix run ~/src/dotfiles/.config/home-manager#homeConfigurations.ankurs4.activationPackage

{
  description = "Home Manager configuration of Ankur";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
        url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations.ankurs4 = home-manager.lib.homeManagerConfiguration {
      # pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      # below is same as legacyPackages above but with allowUnfree
      pkgs = import nixpkgs {
          system = builtins.abort "TODO change arch aarch64-darwin";
          config.allowUnfree = true;
      };

      # passed to home.nix
      extraSpecialArgs = {
        install_gui_apps = builtins.abort "TODO set this";
        my_user_name = builtins.abort "TODO set this";
        my_home_dir = builtins.abort "TODO set this";
      };
      modules = [
        ./home.nix
      ];
    };
  };
}
