HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt vi

VIM_MODE_VIMCDM_KEY='^D'

export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export PROMPT="%F{blue}%n%f@%F{red}%M%f [%~] $ "

setopt autocd autopushd

wd() {
    . /usr/share/wd/wd.sh
}

EDITOR=vim

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function expand-alias() {
	zle _expand_alias
	zle self-insert
}
zle -N expand-alias
bindkey -M main '^ ' expand-alias

alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias zshrc_reload='source ~/.zshrc'
alias xmonad.hs='vim ~/.xmonad/xmonad.hs'
alias xmobarrc='vim ~/.xmobarrc'
alias muttrc='vim ~/.muttrc'
alias xinitrc='vim ~/.xinitrc'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias links='elinks'
alias mutt='neomutt'

alias unistra_sertit_8='xfreerdp /u:mparusinski /p:mP2217lI /v:130.79.221.8:3389 /size:1600x1200 /scale:180 /compression-level:2 /dynamic-resolution /monitors:1 /jpeg-quality:50 /bpp:16 -wallpaper -decorations -themes -menu-anims +clipboard'

EDITOR=vim
