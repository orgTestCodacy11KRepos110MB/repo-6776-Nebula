# Auto start xorg
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx &>/dev/null
fi


# Random cowsay with random fortune
#fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
#fortune -a | cowsay -f moose

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/barbarossa/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting history-substring-search thefuck z ripgrep fzf fd colored-man-pages command-not-found history zsh_reload archlinux catimg git tmux taskwarrior adb pass ufw systemd)

#For z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

export FZF_BASE=/usr/bin/fzf

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and the1mes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias weather="curl 'wttr.in/?T'"
alias svim="sudoedit"
#alias tgone="export TERM=tmux;gone -n;export TERM=tmux-256color"
#alias pomo='muccadoro | tee -ai ~/pomodoros.txt'
alias cht='f(){ curl -s "cheat.sh/$(echo -n "$*"|jq -sRr @uri)";};f'
alias paclab="sudo paclabel -Ls"
alias labels="paclabel -Ll"
alias li="exa --icons"
#alias rcd=". ranger"
#alias gd="googler -n 4"
#alias tuirm="tuir --enable-media"
#alias mdl="youtube-dl --add-metadata -xic -f bestaudio/best -o '~/Music/%(title)s.%(ext)s' --audio-format mp3 --embed-thumbnail"
#alias tncmpcpp='tmux new-session "tmux source-file ~/.ncmpcpp/tmux_session"'
#alias ueberncmpcpp='~/.ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'
#alias spotify='tmux new-session "tmux source-file ~/.config/spotifyd/tmux_session"'
#alias happyanniversary="cat For_my_lovebug | pv -qL 12"
#alias happybirthday="cat happy_birthday_boo"
#alias cligoogle="BROWSER=w3m googler"
alias clip="xclip -sel clip"
alias logout="kill -9 -1"
alias ttcmd="echo '' | fzf -q '$*' --prompt '│ ' --pointer '― ' --preview-window=up:99% --preview='eval {q}'"
alias startvpn="pass sshthanos | sudo openconnect vpn.som.umaryland.edu -b -q --user=cullen.ross --authgroup SOM-Multifactor --passwd-on-stdin --servercert pin-sha256:zWuWUmGaQEWraG+Xvv6uF58rrupSRmqCzeNioSDEaaI="
alias stopvpn="sudo pkill openconnect"
alias sshthanos="ssh cullen.ross@thanos.igs.umaryland.edu"
alias fet="info='n user os sh wm kern pkgs term col' separator=' | ' accent='2' fet.sh"
#alias bm="bashmount"
alias fm="setsid -f nautilus $(pwd)"
alias vim="nvim"
#alias c="eva"
alias btop="bpytop"
alias yayinst="yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -ro sudo yay -S"
#alias r="ranger"
alias cat="bat"
alias pfetch="curl -s https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch | sh"
#alias doom="~/.emacs.d/bin/doom"
#alias e="emacs"
#alias et="TERM=xterm-24bit emacs -nw"
#alias navi="navi --fzf-overrides '--reverse  --color fg:7,bg:-1,hl:6,fg+:6,bg+:-1,hl+:6,info:2,prompt:1,spinner:5,pointer:5,marker:3,header:8'"
alias qtilecheck="python3 -m py_compile ~/.config/qtile/config.py"
alias yay="paru"
alias sshpi="ssh pi@192.168.0.18"
alias piunmount="ssh pi@192.168.0.18 sudo /mnt/fd1/unmount.sh"
alias backupssh="rsync -a --delete --quiet -e ssh / pi@192.168.0.18:/media/RaspberryPi/Genome"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#completion
autoload -Uz compinit && compinit
# Completion for kitty
#kitty + complete setup zsh | source /dev/stdin

#for thefuck
eval $(thefuck --alias)

# colorscheme for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'  --color fg:7,bg:-1,hl:6,fg+:6,bg+:-1,hl+:6 --color info:2,prompt:1,spinner:5,pointer:5,marker:3,header:8'

#for bat theme
export BAT_THEME="base16"

#Shit, forgot whats this is for
fpath=(~/.zsh.d/ $fpath)

# Hit Q in order to get out of ranger in the directory you're in
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# disable zsh-autocomplete autocorrections
#zstyle ':autocomplete:*' magic off

# Pfetch configuration
export PF_INFO="ascii title os kernel wm pkgs shell term palette"
# for pfetch; term doesn't show properly in tmux
export TERM_PROGRAM="alacritty"

# pidswallow fix
[ -n "$DISPLAY" ]  && command -v xdo >/dev/null 2>&1 && xdo id > /tmp/term-wid-"$$"
trap "( rm -f /tmp/term-wid-"$$" )" EXIT HUP

# source navi
#source <(navi widget zsh)

#papis autocomplete
#eval "$(_PAPIS_COMPLETE=source_zsh papis)"

#Add empty space between prompts
#precmd() { print "" }

# hide division sign on incomplete line
PROMPT_EOL_MARK=''

#For Termite: open new termite in same directory
#if [[ $TERM == xterm-termite ]]; then
#  . /etc/profile.d/vte.sh
#  __vte_osc7
#fi

#For nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

#NNN settings
export NNN_COLORS='4231'
export NNN_FCOLORS='00010203040506070a0b0c0d0e0f'
export NNN_OPTS=""
export NNN_BMS='d:~/Documents/personal'
export NNN_PLUG='b:bookmarks;z:fzz;n:nuke;l:launch;s:suedit;b:bulknew'
export NNN_OPENER=/home/barbarossa/.config/nnn/plugins/nuke
export TERMINAL=alacritty
export GUI=1
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=1
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
*.7z=:\
*.a=:\
*.ai=:\
*.apk=:\
*.asm=:\
*.asp=:\
*.aup=:\
*.avi=:\
*.awk=:\
*.bash=:\
*.bat=:\
*.bmp=:\
*.bz2=:\
*.c=:\
*.c++=:\
*.cab=:\
*.cbr=:\
*.cbz=:\
*.cc=:\
*.class=:\
*.clj=:\
*.cljc=:\
*.cljs=:\
*.cmake=:\
*.coffee=:\
*.conf=:\
*.cp=:\
*.cpio=:\
*.cpp=:\
*.cs=:\
*.csh=:\
*.css=:\
*.cue=:\
*.cvs=:\
*.cxx=:\
*.d=:\
*.dart=:\
*.db=:\
*.deb=:\
*.diff=:\
*.dll=:\
*.doc=:\
*.docx=:\
*.dump=:\
*.edn=:\
*.eex=:\
*.efi=:\
*.ejs=:\
*.elf=:\
*.elm=:\
*.epub=:\
*.erl=:\
*.ex=:\
*.exe=:\
*.exs=:\
*.f#=:\
*.fifo=|:\
*.fish=:\
*.flac=:\
*.flv=:\
*.fs=:\
*.fsi=:\
*.fsscript=:\
*.fsx=:\
*.gem=:\
*.gemspec=:\
*.gif=:\
*.go=:\
*.gz=:\
*.gzip=:\
*.h=:\
*.haml=:\
*.hbs=:\
*.hh=:\
*.hpp=:\
*.hrl=:\
*.hs=:\
*.htaccess=:\
*.htm=:\
*.html=:\
*.htpasswd=:\
*.hxx=:\
*.ico=:\
*.img=:\
*.ini=:\
*.iso=:\
*.jar=:\
*.java=:\
*.jl=:\
*.jpeg=:\
*.jpg=:\
*.js=:\
*.json=:\
*.jsx=:\
*.key=:\
*.ksh=:\
*.leex=:\
*.less=:\
*.lha=:\
*.lhs=:\
*.log=:\
*.lua=:\
*.lzh=:\
*.lzma=:\
*.m4a=:\
*.m4v=:\
*.markdown=:\
*.md=:\
*.mdx=:\
*.mjs=:\
*.mkv=:\
*.ml=λ:\
*.mli=λ:\
*.mov=:\
*.mp3=:\
*.mp4=:\
*.mpeg=:\
*.mpg=:\
*.msi=:\
*.mustache=:\
*.nix=:\
*.o=:\
*.ogg=:\
*.pdf=:\
*.php=:\
*.pl=:\
*.pm=:\
*.png=:\
*.pp=:\
*.ppt=:\
*.pptx=:\
*.ps1=:\
*.psb=:\
*.psd=:\
*.pub=:\
*.py=:\
*.pyc=:\
*.pyd=:\
*.pyo=:\
*.r=ﳒ:\
*.rake=:\
*.rar=:\
*.rb=:\
*.rc=:\
*.rlib=:\
*.rmd=:\
*.rom=:\
*.rpm=:\
*.rproj=鉶:\
*.rs=:\
*.rss=:\
*.rtf=:\
*.s=:\
*.sass=:\
*.scala=:\
*.scss=:\
*.sh=:\
*.slim=:\
*.sln=:\
*.so=:\
*.sql=:\
*.styl=:\
*.suo=:\
*.swift=:\
*.t=:\
*.tar=:\
*.tex=ﭨ:\
*.tgz=:\
*.toml=:\
*.ts=:\
*.tsx=:\
*.twig=:\
*.vim=:\
*.vimrc=:\
*.vue=﵂:\
*.wav=:\
*.webm=:\
*.webmanifest=:\
*.webp=:\
*.xbps=:\
*.xcplayground=:\
*.xhtml=:\
*.xls=:\
*.xlsx=:\
*.xml=:\
*.xul=:\
*.xz=:\
*.yaml=:\
*.yml=:\
*.zip=:\
*.zsh=:\
"

export OPENER=rifle
printf "\033]0; $(pwd | sed "s|$HOME|~|") - lf\007" > /dev/tty

lf () {
    tmp="$(mktemp)"
    /usr/bin/lf --last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==35=35}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*:descriptions' format $'\e[01;33m %d\e[0m'
zstyle ':completion:*:messages' format $'\e[01;31m %d\e[0m'
