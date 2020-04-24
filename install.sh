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
brew install fish
brew install bat
brew install fd
brew install hyperfine
brew install diskus
brew install exa

# Configure git
git config --global user.name 'Dan Rigby'
git config --global user.email 'danrigby@github.com'
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
git config --global help.autocorrect '30'
git config --global alias.lg 'log --color --graph --pretty=format"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}; git submodule update --init --recursive'

# Configure fish shell
fish
abbr -a cbuild '/workspace/enterprise2/chroot-build.sh'
abbr -a creset '/workspace/enterprise2/chroot-reset.sh'
abbr -a cconfig '/workspace/enterprise2/chroot-configure.sh'
abbr -a cstart '/workspace/enterprise2/chroot-start.sh'
abbr -a cinfo '/workspace/enterprise2/chroot-info.sh'
abbr -a cssh '/workspace/enterprise2/chroot-ssh.sh'
abbr -a cip '/workspace/enterprise2/chroot-ip.sh'
abbr -a cstop '/workspace/enterprise2/chroot-stop.sh'
abbr -a ccinfo '/workspace/enterprise2/chroot-cluster-info.sh'
abbr -a ccip '/workspace/enterprise2/chroot-cluster-ip.sh'
abbr -a ccstart '/workspace/enterprise2/chroot-cluster-start.sh'
abbr -a ccstop '/workspace/enterprise2/chroot-cluster-stop.sh'
abbr -a ccssh '/workspace/enterprise2/chroot-cluster-ssh.sh'
abbr -a gclean 'sudo git clean -fdx'
abbr -a dclean 'docker system prune --all'
exit
