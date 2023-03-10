defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

brew install vim neovim tmux fzf;
brew install --HEAD universal-ctags/universal-ctags/universal-ctags;

$(brew --prefix)/opt/fzf/install;


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -sF $(pwd)/nvim ~/.config/nvim;

cp .editorconfig .tmux.conf .iterm2_profile.json ~/
