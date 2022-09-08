#!/bin/bash

# setup terminal

## install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## core
brew install python go thefuck

## git config
echo "configuring git"
echo "enter the name you'd like associated with git: "
read gitname
git config --global user.name $gitname
echo "enter the email you'd like associated with git: "
read gitemail
git config --global user.email $gitemail

## :)
go install github.com/cameronbrill/create-go-app@latest

## apps
brew tap homebrew/cask-versions
brew install --cask firefox-developer-edition
brew install --cask google-chrome
brew install --cask 1password
brew install --cask spotify
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask raycast
brew install --cask expressvpn

# graphite
brew install withgraphite/tap/graphite

echo "configuring graphite"
echo "Visit https://app.graphite.dev/activate to obtain your auth token and then paste here: "
read graphitetoken
gt auth --token $graphitetoken

## link dotfiles
cd ~
git clone https://github.com/cameronbrill/dotfiles.git
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
echo 'paste zsh-history-substring-search.zsh path printed above to ~/.zshrc'