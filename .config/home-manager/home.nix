# Install nix and home-manager using the official instructions
# nix-channel --update
# create a new home-manager generation after making changes to this file
# creating a new generation of home manager = build home.nix and install all packages specified there

# home-manager switch
# builds the new generation and switches to it

{ config, pkgs, install_gui_apps, my_user_name, my_home_dir, ... }:

let
    lemminx_drv = pkgs.callPackage ./lemminx.nix { pkgs = pkgs; };
    firefox_mac_drv = pkgs.callPackage ./firefox.nix {};

    common_pkgs = [
        pkgs.htop
        pkgs.wget
        pkgs.curl
        pkgs.unzip
        pkgs.gnutar
        pkgs.git
        pkgs.gnused
        pkgs.fd
        pkgs.file
        pkgs.tree
        pkgs.ripgrep
        pkgs.lemonade
        pkgs.python311
        pkgs.neovim
        pkgs.tmux
        pkgs.ncdu
        pkgs.vim
        pkgs.jq
        pkgs.nodePackages.livedown

        # Language servers
        pkgs.nodePackages.pyright
        pkgs.clang-tools_15
        pkgs.lua-language-server
        pkgs.cmake-language-server
        pkgs.nodePackages.typescript
        pkgs.nodePackages.typescript-language-server
        pkgs.nodePackages.svelte-language-server
        pkgs.nodePackages."@tailwindcss/language-server"
        pkgs.nodePackages."@prisma/language-server"
        pkgs.nodePackages.vscode-langservers-extracted # contains html,css,json,eslint
        pkgs.rnix-lsp
        lemminx_drv
    ] ++ (if !install_gui_apps then [] else [
        pkgs.alacritty
        # fonts
        pkgs.fontconfig
        (pkgs.nerdfonts.override {
            fonts = [
                "CascadiaCode"
                "DroidSansMono"
                "FiraCode"
                "Hack"
                "VictorMono"
            ];
        })
        # view pdf and images - use as `nixGL mupdf file.png`
        pkgs.mupdf
    ]);

    linux_pkgs = [
        pkgs.glibcLocales
        pkgs.nettools
        pkgs.traceroute
        pkgs.xclip
    ] ++ (if !install_gui_apps then [] else [
        pkgs.i3
        pkgs.i3lock
        pkgs.i3status
        pkgs.rofi-unwrapped
        pkgs.keychain
        pkgs.firefox
    ]);

    mac_pkgs = [] ++ (if !install_gui_apps then [] else [
        pkgs.iterm2
        pkgs.vscode
        firefox_mac_drv
        pkgs.yabai
        pkgs.skhd
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
