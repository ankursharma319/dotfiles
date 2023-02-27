# Install nix and home-manager using the official instructions
# nix-channel --update
# create a new home-manager generation after making changes to this file
# creating a new generation of home manager = build home.nix and install all packages specified there

# home-manager switch
# builds the new generation and switches to it

{ config, pkgs, ... }:

let
    pkgs_unstable = import <nixpkgs_unstable> {};
in

{
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "ankurs4";
    home.homeDirectory = "/Users/ankurs4";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.packages = [
        pkgs_unstable.htop
    ];
}
