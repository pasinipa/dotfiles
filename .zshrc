# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh-histfile
HISTSIZE=10000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pasinipa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Makes Ctrl-P and Ctrl-N work as in Emacs mode
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# Allows for case insensitive auto-completions
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
fastfetch

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ff='fastfetch'
alias v='nvim'
# safe versions of rm and mv
alias mv="mv -i"
alias rm='echo "rm is disabled, use remove or trash or /bin/rm instead."'
alias remove="/bin/rm -irv"

if [[ "$TERM" = "linux" ]] then
	setterm --blank 5 --powerdown 1

	# COMMAND PROMPT
	PS0='\n'
	PS1='%n %F{blue}%B%~%b%f %F{%(?.green.red)}>%f '
	PS2=' %F{yellow}>%f '
else
	eval "$(starship init zsh)"
fi
