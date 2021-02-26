#!/bin/sh

set -eu

# 実行場所のディレクトリを取得
SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade

formulas=(
  wget
  git
  tree
  tig
  ag
  jq
  python3
  peco
  envchain
  tmux
  bat
  fd
  reattach-to-user-namespace
  starship
  ghq
  gpg
  mysql
  postgresql
  ripgrep
  exa
  procs
  openssl
  vim
  1password
)

echo "brew tap"

# フォント管理
brew tap homebrew/cask-fonts

echo "brew install formula"
for formula in "${formulas[@]}"; do
	brew install $formula || brew upgrade $formula
done

# install gui up
casks=(
    alfred
    cheatsheet
    clipy
    deepl
    docker
    drawio
    dropbox
    google-chrome
    google-japanese-ime
    gyazo
    hyperswitch
    iterm2
    notion
    rectangle
    sequel-ace
    slack
    spotify
    visual-studio-code
    zoom
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

brew cleanup

echo "brew installed"

ln -s $SCRIPT_DIR/.zshrc $HOME/.zshrc
ln -s $SCRIPT_DIR/.zlogout $HOME/.zlogout
ln -s $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf
ln -s $SCRIPT_DIR/.gitconfig $HOME/.gitconfig
ln -s $SCRIPT_DIR/.git_commit_message $HOME/.git_commit_message
ln -s $SCRIPT_DIR/.ignore $HOME/.ignore
git config --global commit.template $HOME/.git_commit_message
ln -s $SCRIPT_DIR/vscode/keybindings.json ~/Library/Application\ Support/Code/User/
ln -s $SCRIPT_DIR/vscode/settings.json ~/Library/Application\ Support/Code/User/
