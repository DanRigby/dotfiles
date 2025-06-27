#!/bin/bash

# Install Homebrew if needed
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

# Install tools
brew install bat
brew install curlie
brew install ddh
brew install difftastic
brew install diskus
brew install dive
brew install dust
brew install eza
brew install fd
brew install fortune
brew install fselect
brew install fzf
brew install git-delta
brew install gitui
brew install glow
brew install htop
brew install hyperfine
brew install jid
brew install jq
brew install k9s
brew install lazydocker
brew install lazygit
brew install moreutils
brew install procs
brew install ripgrep
brew install sd
brew install shellcheck
brew install tmux
brew install tokei
brew install watch
brew install watchexec
brew install xh
brew install yq
