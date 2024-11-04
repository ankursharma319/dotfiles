# Dotfiles

My dotfiles for configuration of both linux and macos devices. Includes packages provisioned via nix home-manager. Includes configuration of neovim, i3wm, alacritty, tmux and so on.

## Screenshots

![Ubuntu i3wm with alacritty, tmux, neovim](./ubuntu_i3_screenshot.png)

## Usage

Clone into some directory and create softlinks for whatever you need:

```bash
mkdir -p /home/ankurs4/.config
ln -s /home/ankurs4/src/dotfiles/.vimrc /home/ankurs4/.vimrc
ln -s /home/ankurs4/src/dotfiles/.config/nvim /home/ankurs4/.config/nvim
ln -s /home/ankurs4/src/dotfiles/.tmux.conf /home/ankurs4/.tmux.conf
ln -s /home/ankurs4/src/dotfiles/.bashrc /home/ankurs4/.bashrc
ln -s /home/ankurs4/src/dotfiles/.bash_profile /home/ankurs4/.bash_profile
ln -s /home/ankurs4/src/dotfiles/.zshrc /home/ankurs4/.zshrc
ln -s /home/ankurs4/src/dotfiles/.config/nix /home/ankurs4/.config/nix
ln -s /home/ankurs4/src/dotfiles/.config/nixpkgs /home/ankurs4/.config/nixpkgs
ln -s /home/ankurs4/src/dotfiles/.config/home-manager /home/ankurs4/.config/home-manager
ln -s /home/ankurs4/src/dotfiles/.nix-channels /home/ankurs4/.nix-channels
ln -s /home/ankurs4/src/dotfiles/.config/lemonade.toml /home/ankurs4/.config/lemonade.toml
ln -s /home/ankurs4/src/dotfiles/.gitconfig /home/ankurs4/.gitconfig
ln -s /home/ankurs4/src/dotfiles/.global_gitignore /home/ankurs4/.global_gitignore
ln -s /home/ankurs4/src/dotfiles/.config/alacritty /home/ankurs4/.config/alacritty
ln -s /home/ankurs4/src/dotfiles/.config/i3 /home/ankurs4/.config/i3
ln -s /home/ankurs4/src/dotfiles/.config/i3status /home/ankurs4/.config/i3status
ln -s /home/ankurs4/src/dotfiles/.config/rofi /home/ankurs4/.config/rofi
ln -s /home/ankurs4/src/dotfiles/.yabairc /home/ankurs4/.yabairc
ln -s /home/ankurs4/src/dotfiles/.config/skhd /home/ankurs4/.config/skhd
ln -s /home/ankurs4/src/dotfiles/.config/spacebar /home/ankurs4/.config/spacebar
mkdir -p /home/ankurs4/.docker
ln -s /home/ankurs4/src/dotfiles/.docker/config.json /home/ankurs4/.docker/config.json
```

For VsCode:

```bash
# on linux
ln -s /home/ankurs4/src/dotfiles/.config/Code/User/settings.json /home/ankurs4/.config/Code/User/settings.json
ln -s /home/ankurs4/src/dotfiles/.config/Code/User/keybindings.json /home/ankurs4/.config/Code/User/keybindings.json
# on mac
ln -s /Users/ankurs4/src/dotfiles/.config/Code/User/settings.json "/Users/ankurs4/Library/Application Support/Code/User/settings.json"
ln -s /Users/ankurs4/src/dotfiles/.config/Code/User/keybindings.json "Users/ankurs4/Library/Application Support/Code/User/keybindings.json"
```

For home-manager stuff, install nix and run `nix run ~/src/dotfiles/.config/home-manager#homeConfigurations.ankurs4.activationPackage`

## Notes

For running alacritty on linux machine: `nix run --impure github:guibou/nixGL -- alacritty`
