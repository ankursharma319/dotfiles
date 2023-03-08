# nix shell for installing tressitter grammars
# produces .so files which can be used by treesitter

# first remove existing nvim-treesitter stuff
# rm -rf ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter
# rm -rf ~/.local/share/nvim/site/parser

# run as:
# nix-shell --command 'CC=gcc nvim' ~/.config/nvim/shell_tsgrammars.nix
# and wait til treesitter stuff is installed.

{ pkgs ? import <nixpkgs_unstable> {} }:

pkgs.mkShell {
    buildInputs = [
        pkgs.git
        pkgs.which
        pkgs.curl
        pkgs.gnutar
        pkgs.gcc
        pkgs.nodejs
        pkgs.neovim
        pkgs.tree-sitter
        (pkgs.python311.withPackages (pp: [pp.pynvim]))
    ];
}

