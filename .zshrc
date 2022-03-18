# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mparusinski/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
	for rc in ~/.zshrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
