#!/bin/bash

# setup terminal

## install bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## core
brew install python go thefuck

## :)
go install github.com/cameronbrill/create-go-app

## apps
brew tap homebrew/cask-versions
brew install --cask firefox-developer-edition
brew install --cask google-chrome
brew install --cask bitwarden
brew install --cask spotify
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask raycast
brew install --cask expressvpn

## link dotfiles
cd ~
git clone git@github.com:cameronbrill/dotfiles.git
for i in dotfiles/.*; do
  file=${i##*/}
  if [[ "${file}" == "." || "${file}" == ".." || "${file}" == ".git" ]]; then
    continue
  fi
  ln -s ~/dotfiles/${file} "~/$i"
done

## install vscode config
for - in dotfiles/code/*.json; do
  file=${i##*/}
  if [[ "${file}" == "." || "${file}" == ".." || "${file}" == ".git" ]]; then
    continue
  fi
  ln -s ~/dotfiles/code/${file} ~/Library/Application\ Support/Code/User/${file}
done


## instal zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install zsh-history-substring-search
echo 'source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh' >> ~/.zshrc