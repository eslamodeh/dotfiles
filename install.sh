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

echo "Installing default packages"
brew install gh cmake vim neovim tmux fzf tig ag prettier rg fd;
pip3 install pynvim; # for nvim
brew install --HEAD universal-ctags;
brew install rbenv pyenv nvm;
brew install reattach-to-user-namespace; # for tmux copy
brew install catimg; # for image preview inside telescope
$(brew --prefix)/opt/fzf/install;

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';

echo "Linking nvim"
rm ~/.config/nvim;
ln -sF $(pwd)/nvim ~/.config/nvim;

echo "Copying configuration file"
cp .zshrc .editorconfig .tmux.conf .iterm2_profile.json ~/;


echo "Installing autoenv"
brew install autoenv;
printf '%s\n' "source $(brew --prefix autoenv)/activate.sh" >> "${ZDOTDIR:-$HOME}/.zprofile"
