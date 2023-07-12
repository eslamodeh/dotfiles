/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

# Autoload Brew
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') > $HOME/.zprofile;
# Autoload autoenv
printf '%s\n' "source $(brew --prefix autoenv)/activate.sh" >> "${ZDOTDIR:-$HOME}/.zprofile"

eval "$(/opt/homebrew/bin/brew shellenv)";

defaults write -g InitialKeyRepeat -int 10; # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1; # normal minimum is 2 (30 ms)

brew install cmake vim neovim tmux fzf tig rbenv pyenv ag prettier autoenv;
pip3 install pynvim black pylint;
brew install --HEAD universal-ctags/universal-ctags/universal-ctags;

$(brew --prefix)/opt/fzf/install;


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';

rm ~/.config/nvim;
ln -sF $(pwd)/nvim ~/.config/nvim;

cp .zshrc .editorconfig .tmux.conf .iterm2_profile.json ~/;
