
source ~/.bashrc

setopt sharehistory

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# https://zsh-prompt-generator.site
PROMPT="%B%F{34}%n%f%b%B%F{34}@%f%b%B%F{34}%m%f%b%B: %b%B%F{75}%~%f%b $ "

# https://github.com/zsh-users/zsh-completions
MY_ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"
ZSH_COMPLETIONS_DIR="$MY_ZSH_PLUGINS_DIR/zsh-completions"
if [ ! -d "$ZSH_COMPLETIONS_DIR" ]; then
  echo "$ZSH_COMPLETIONS_DIR does not exist, cloning it now"
  mkdir -p $MY_ZSH_PLUGINS_DIR
  git clone https://github.com/zsh-users/zsh-completions.git $ZSH_COMPLETIONS_DIR
fi

fpath=($ZSH_COMPLETIONS_DIR $fpath)

# https://stackoverflow.com/a/63661686
autoload -U compinit
compinit

autoload -U select-word-style
select-word-style bash

