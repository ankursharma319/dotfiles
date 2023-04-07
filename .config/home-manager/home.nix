# Install nix and home-manager using the official instructions
# nix-channel --update
# create a new home-manager generation after making changes to this file
# creating a new generation of home manager = build home.nix and install all packages specified there

# home-manager switch
# builds the new generation and switches to it

{ config, pkgs, install_gui_apps, my_user_name, my_home_dir, ... }:

let
    pkgs_unstable = pkgs;

    lemminx_drv = pkgs_unstable.callPackage ./lemminx.nix { pkgs = pkgs_unstable; };

    common_pkgs = [
        pkgs_unstable.htop
        pkgs_unstable.wget
        pkgs_unstable.curl
        pkgs_unstable.unzip
        pkgs_unstable.gnutar
        pkgs_unstable.git
        pkgs_unstable.gnused
        pkgs_unstable.fd
        pkgs_unstable.file
        pkgs_unstable.tree
        pkgs_unstable.ripgrep
        pkgs_unstable.lemonade
        pkgs_unstable.python311
        pkgs_unstable.neovim
        pkgs_unstable.tmux
        pkgs_unstable.ncdu

        # Language servers
        pkgs_unstable.nodePackages.pyright
        pkgs_unstable.clang-tools_15
        pkgs_unstable.lua-language-server
        pkgs_unstable.cmake-language-server
        pkgs_unstable.nodePackages.typescript
        pkgs_unstable.nodePackages.typescript-language-server
        pkgs_unstable.nodePackages.vscode-langservers-extracted # contains html,css,json,eslint
        pkgs_unstable.rnix-lsp
        lemminx_drv
    ] ++ (if !install_gui_apps then [] else [
        pkgs_unstable.alacritty
        # fonts
        pkgs_unstable.fontconfig
        (pkgs_unstable.nerdfonts.override {
            fonts = [
                "CascadiaCode"
                "DroidSansMono"
                "FiraCode"
                "Hack"
                "VictorMono"
            ];
        })
    ]);

    linux_pkgs = [
        pkgs_unstable.glibcLocales
        pkgs_unstable.nettools
        pkgs_unstable.traceroute
        pkgs_unstable.xclip
    ] ++ (if !install_gui_apps then [] else [
        pkgs_unstable.i3
        pkgs_unstable.i3lock
        pkgs_unstable.i3status
        pkgs_unstable.rofi-unwrapped
        pkgs_unstable.keychain
    ]);

    mac_pkgs = [] ++ (if !install_gui_apps then [] else [
        pkgs_unstable.iterm2
        pkgs_unstable.vscode
    ]);

    platform_specific_pkgs = if pkgs.stdenv.isLinux then linux_pkgs else mac_pkgs;
    total_pkgs = common_pkgs ++ platform_specific_pkgs;
in

{
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = my_user_name;
    home.homeDirectory = my_home_dir;

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

    fonts.fontconfig.enable = install_gui_apps;

    home.packages = total_pkgs;
}
