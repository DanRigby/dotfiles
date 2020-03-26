#!/bin/bash

dotdir=$(cd $(dirname $0) && pwd)

for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done

git config --global user.name 'Dan Rigby' \
&& git config --global user.email 'danrigby@github.com' \
&& git config --global user.signingkey '5E1D95FC1C4E6899' \
&& git config --global core.editor 'nano' \
&& git config --global alias.co 'checkout' \
&& git config --global alias.br 'branch' \
&& git config --global alias.ci 'commit' \
&& git config --global alias.st 'status' \
&& git config --global alias.graph 'log --oneline --graph --decorate --all' \
&& git config --global alias.branches 'branch -v' \
&& git config --global alias.tags 'tag' \
&& git config --global alias.stashes 'stash list' \
&& git config --global alias.discard 'checkout --' \
&& git config --global alias.uncommit 'reset --mixed HEAD~' \
&& git config --global alias.remotes 'remote -v' \
&& git config --global alias.agc 'gc --aggressive --prune=all' \
&& git config --global help.autocorrect '30' \
&& git config --global alias.lg 'log --color --graph --pretty=format"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit' \
&& git config --global alias.up '!git remote update -p; git merge --ff-only @{u}; git submodule update --init --recursive'
