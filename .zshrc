if [[ ":$FPATH:" != *":/home/baka/.zsh/completions:"* ]]; then export FPATH="/home/baka/.zsh/completions:$FPATH"; fi
# Load before `source $ZSH/oh-my-zsh.sh`
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic-custom"

plugins=(
    ugit # https://github.com/Bhupesh-V/ugit
    gitignore  # gi
    gh
    vi-mode
    command-not-found
    colored-man-pages
    mise
    docker
    shrink-path
    zsh-autosuggestions
    fast-syntax-highlighting
    fzf-tab
    web-search
)

source $ZSH/oh-my-zsh.sh

if [[ -f ~/.aliases.zsh ]]; then
    source $HOME/.aliases.zsh # aliases
fi

if [[ -f ~/.env.zsh ]]; then
    source $HOME/.env.zsh # secret keys
fi

fpath+=~/.zfunc

# Bindings:
bindkey '^ ' autosuggest-accept
bindkey -s '^n' 'nvim $(fzf)^M'

# [Cod](https://github.com/dim-an/cod)
source <(cod init $$ zsh)


[[ -s "$HOME/.grc/grc.zsh" ]] && source $HOME/.grc/grc.zsh


export PATH="$HOME/.config/v-analyzer/bin/:$PATH"
export PATH="$HOME/apps/elixir-ls/release:$PATH"

# nim-lang
export PATH="$HOME/.nimble/bin:$PATH"

export PATH="$HOME/.r2env/bin:$PATH"

# Flatpak
export PATH="/var/lib/flatpak/exports/share:$PATH"
export PATH="$HOME/.local/share/flatpak/exports/share:$PATH"

# Cuda
export PATH="/usr/local/cuda-12.4/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH"
export LIBRARY_PATH="/usr/local/cuda-12.4/lib64:$LIBRARY_PATH"
export CUDA_HOME="/usr/local/cuda-12.4"

# -----------------------------------------------------------------------------
# PYTHON
# export PYTHONPATH="./venv/bin/python"
# For OpenCV
# export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.10/site-packages"
# export PYTHONSTARTUP="${HOME}/.pyrc"
# export PYTHONIOENCODING="UTF-8"

# Virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# -----------------------------------------------------------------------------

export GTK_THEME='Yaru-dark'

# export R2PM_DBDIR="$HOME/apps/radare2/radare2-pm/db"
export R2PM_PLUGDIR=$HOME/.radare2/plugins
export R2PM_DBDIR=$HOME/.radare2/r2pm/db
export R2PM_GITDIR=$HOME/.radare2/r2pm/git

# RETDEC
export RID=$HOME/apps/retdec/bin

################################################################################
# FZF
#
export FZF_BASE=$HOME/.fzf/bin/fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude .venv --exclude __pycache__'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --height 100%"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}' --height 100%"
export FZF_CTRL_R_OPTS="
    --preview 'echo {}' --preview-window up:3:hidden:wrap
    --bind 'ctrl-t:execute-silent(echo -n {2..} | xclip -i)+abort'
    --color header:italic
    --header 'Press CTRL-T to copy command into clipboard'
    --height 80%"

_fzf_compgen_path() {
    fdfind --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fdfind --type d --hidden --follow --exclude ".git" . "$1"
}

# Change selection to space instead of tab / shift-tab
export FZF_DEFAULT_OPTS="--bind 'tab:down,shift-tab:up,space:toggle'"

HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

setopt hist_ignore_all_dups
setopt hist_ignore_space

# export MANPAGER="nvim -c set ft=man -"

# Colors for man pages
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0 282828" #black        #282828
    echo -en "\e]P8 928374" #darkgrey     #928374
    echo -en "\e]P1 CC241D" #darkred      #CC241D
    echo -en "\e]P9 FB4934" #red          #FB4934
    echo -en "\e]P2 98971A" #darkgreen    #98971A
    echo -en "\e]PA B8BB26" #green        #B8BB26
    echo -en "\e]P3 D79921" #brown        #D79921
    echo -en "\e]PB FABD2F" #yellow       #FABD2F
    echo -en "\e]P4 458588" #darkblue     #458588
    echo -en "\e]PC 83A598" #blue         #83A598
    echo -en "\e]P5 B16286" #darkmagenta  #B16286
    echo -en "\e]PD D3869B" #magenta      #D3869B
    echo -en "\e]P6 689D6A" #darkcyan     #689D6A
    echo -en "\e]PE 8EC07C" #cyan         #8EC07C
    echo -en "\e]P7 A89984" #lightgrey    #A89984
    echo -en "\e]PF EBDBB2" #white        #EBDBB2
    clear # for background artifacting
fi

################################################################################

export IRUBY_SESSION_ADAPTER="cztop"

export LS_COLORS="rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:";
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

export EDITOR=nvim
export BROWSER=brave-browser
export PAGER="bat -p"
export TERM="xterm-256color"
export TIMEFMT=$'\n[job name] %J\n\n\t[0] real:    %E :: %mE :: %uE\n\t[1] user:    %U\n\t[2]  sys:    %S\n\t[3]  cpu:    %P'

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview;p:preview-tui;t:preview-tabbed'
export GPG_TTY=$(tty)

export GPG_TTY=\$(tty)
export PSQL_PAGER='pspg -X -s 5'

export QT_QPA_PLATFORMTHEME=qt5ct

# Podman related
export KIND_EXPERIMENTAL_PROVIDER=podman

# source /home/baka/.config/broot/launcher/bash/br

################################################################################
#
# Mise related
eval "$(/home/baka/.local/bin/mise activate zsh)"
export PATH="$HOME/.local/share/mise/shims:$PATH"

