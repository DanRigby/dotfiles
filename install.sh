#!/bin/bash

# Copy dotfiles
dotdir=$(cd $(dirname $0) && pwd)
for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done

# Install homebrew
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> /workspace/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install tools
brew install bat
brew install diskus
brew install exa
brew install fd
brew install fish
brew install fortune
brew install gh
brew install git-delta
brew install hyperfine
brew install jid
brew install ripgrep
go get github.com/arsham/rainbow

# Install rust
brew install rustup-init
rustup-init -y
brew uninstall rustup-init

# Configure git
git config --global user.name 'Dan Rigby'
git config --global user.email 'danrigby@github.com'
git config --global help.autocorrect '30'
git config --global core.pager 'delta --dark --plus-color="#012800" --minus-color="#340001" --theme="Monokai Extended"'
git config --global interactive.diffFilter 'delta --color-only'
git config --global push.default current
git config --global alias.co 'checkout'
git config --global alias.br 'branch'
git config --global alias.ci 'commit'
git config --global alias.st 'status'
git config --global alias.graph 'log --oneline --graph --decorate --all'
git config --global alias.branches 'branch -v'
git config --global alias.tags 'tag'
git config --global alias.stashes 'stash list'
git config --global alias.discard 'checkout --'
git config --global alias.uncommit 'reset --mixed HEAD~'
git config --global alias.remotes 'remote -v'
git config --global alias.agc 'gc --aggressive --prune=all'
git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}; git submodule update --init --recursive'

# Configure fish shell
fish -c 'set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths'
fish -c 'set -U fish_user_paths $HOME/go/bin $fish_user_paths'
fish -c 'set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin/ $fish_user_paths'
fish -c 'function fish_greeting
    fortune | rainbow
end
funcsave fish_greeting'
fish -c "abbr -a cbuild '/workspace/enterprise2/chroot-build.sh'"
fish -c "abbr -a creset '/workspace/enterprise2/chroot-reset.sh'"
fish -c "abbr -a cconfig '/workspace/enterprise2/chroot-configure.sh'"
fish -c "abbr -a cstart '/workspace/enterprise2/chroot-start.sh'"
fish -c "abbr -a cinfo '/workspace/enterprise2/chroot-info.sh'"
fish -c "abbr -a cssh '/workspace/enterprise2/chroot-ssh.sh'"
fish -c "abbr -a cip '/workspace/enterprise2/chroot-ip.sh'"
fish -c "abbr -a cstop '/workspace/enterprise2/chroot-stop.sh'"
fish -c "abbr -a ccinfo '/workspace/enterprise2/chroot-cluster-info.sh'"
fish -c "abbr -a ccip '/workspace/enterprise2/chroot-cluster-ip.sh'"
fish -c "abbr -a ccstart '/workspace/enterprise2/chroot-cluster-start.sh'"
fish -c "abbr -a ccstop '/workspace/enterprise2/chroot-cluster-stop.sh'"
fish -c "abbr -a ccssh '/workspace/enterprise2/chroot-cluster-ssh.sh'"
fish -c "abbr -a gclean 'sudo git clean -fdx'"
fish -c "abbr -a dclean 'docker system prune --all'"
fish -c "abbr -a dc-up 'docker-compose up -d'"
fish -c "abbr -a dc-bup 'docker-compose up -d --build'"
fish -c "abbr -a dc-run 'docker-compose exec ghpi ansible-playbook /code/bootstrap-dev.yml'"
fish -c "abbr -a dc-bash 'docker-compose exec ghpi bash'"
fish -c "abbr -a dc-down 'docker-compose down -t 0'"
