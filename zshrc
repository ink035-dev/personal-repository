export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
source ~/git-prompt.sh

# git prompt option
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

# prompt
setopt PROMPT_SUBST ; PS1=
	'%B%F{014}[ %~ ]%f%F{220} <$SHELL> %f%F{208}git:$(__git_ps1 "(%s)")%f%_
%F{002}@%n->%# %f%b'
RPROMPT='%F{027}%B[%W_%D{%H:%M:%S}]%b%f'

# plugins
plugins=(
	aliases
	git
	history
	tmux
	vi-mode
	web-search
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# zsh-syntax-option
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets cursor)
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='standout'
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'


# session実行後改行
function precmd() {
  # Print a newline before the prompt, unless it's the
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
      NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
      echo ""
  fi
}

# 初回起動時tmux起動
if [ $SHLVL = 1 ]; then
  tmux
fi

# alias ls='ls'
alias exa='exa -lahF'
alias szrc='source ~/.zshrc'
