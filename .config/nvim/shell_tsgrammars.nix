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
    url = "https://github.com/NixOS/nixpkgs/archive/ff0a5a776b56e0ca32d47a4a47695452ec7f7d80.tar.gz";
    sha256 = "1ac53wb5qpbhcmb0lzfl8wn1mnzw82i9355h9vq3lxd47g7zy3sv";
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

