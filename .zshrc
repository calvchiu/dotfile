# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:~/bin:~/.rvm/bin

ZSH_THEME="bureau"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler cp git node npm rails ruby docker docker-compose tmux redis-cli vault kubectl)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tx="tmux -2"
alias tma="tmux attach -d -t"
alias tmg="tmux new -s $(basename $(pwd))"
alias :q="exit"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

alias ag="ag --path-to-agignore ~/.agignore"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

