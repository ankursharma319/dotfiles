# nix shell for installing tressitter grammars
# produces .so files which can be used by treesitter

# first remove existing nvim-treesitter stuff
# rm -rf ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter
# rm -rf ~/.local/share/nvim/site/parser

# run as:
# nix-shell --command 'CC=gcc nvim' ~/.config/nvim/shell_tsgrammars.nix
# and wait til treesitter stuff is installed.
# On linux had more success with simple `nix-shell -p gcc`

{
  pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/3b7c16460a202396d65b65306cb6439193630bf4.tar.gz";
    sha256 = "1d146rbcmbxsarm8rjz30faa22yw43ccsj15nrjpw2c425izay35";
  }) {}
}:
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

