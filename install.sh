#!/bin/bash

# Git Settings
git config --global init.defaultBranch main
git config --global push.default simple
git config --global push.autoSetupRemote true
git config --global merge.conflictstyle zdiff3
git config --global rerere.enabled true
