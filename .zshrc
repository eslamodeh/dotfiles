# Custom aliases
alias please="sudo"
alias rs="rails s"
alias rc="rails c"
alias nv="nvim ."
export EDITOR='nvim'
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

eval "$(rbenv init -)"

function ttmux {
  tmux new -A -s $(pwd);
}


source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
