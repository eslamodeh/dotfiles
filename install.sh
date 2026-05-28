set -e

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing Hombrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
# Autoload Brew
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') > $HOME/.zprofile;
eval "$(/opt/homebrew/bin/brew shellenv)";

echo "Updating keyword speed"
defaults write -g InitialKeyRepeat -int 10; # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1; # normal minimum is 2 (30 ms)

echo "Installing shell + system tools"
brew install vim tmux tig ag;
brew install rbenv pyenv nvm;                 # language version managers
brew install reattach-to-user-namespace;      # tmux copy

echo "Installing nvim + plugin dependencies"
./nvim/scripts/install-deps.sh;

echo "Linking nvim"
rm ~/.config/nvim;
ln -sF $(pwd)/nvim ~/.config/nvim;

echo "Copying configuration file"
cp .zshrc .editorconfig .tmux.conf .iterm2_profile.json ~/;


echo "Installing autoenv"
brew install autoenv;
printf '%s\n' "source $(brew --prefix autoenv)/activate.sh" >> "${ZDOTDIR:-$HOME}/.zprofile"
