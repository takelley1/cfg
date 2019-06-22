# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# auto mount drive since fstab won't work

# COMMANDS ##############################################

        # custom git alias used for backing up dotfiles
        # see https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/	

        alias git-config='/usr/bin/git --git-dir=/home/austin/.cfg/ --work-tree=/home/austin'
	alias gc='git-config'

	alias gp="git commit -a -m 'update' && git push" 
	alias gn="cd ~/notes && git commit -a -m 'update' && git push" 

	# SSH ALIASES #######

	alias router='ssh root@OpenWrt'
        alias pi='ssh austin@raspberrypi'
	alias odroid='ssh austin@192.168.1.3'
	alias uby='ssh austin@192.168.1.11'

	####################

	alias up='sudo apt update && sudo apt upgrade -y'

        alias vi='vim'      

        alias ..='cd ../'
        alias ...='cd ../../../'
        alias root='cd /'
        alias home='cd ~'

        alias mkdir='mkdir --parents --verbose -Z'

        alias l='ls'
        # add color to standard ls
        alias ls='ls -C --classify --color=auto'
        alias la='ls -a  --reverse --human-readable'
        alias ll='ll --human-readable'
        # sort by size
        alias lss='ls -S --reverse --human-readable'
        # show SELinux contexts
        alias lcon='ls -lZ --all --reverse'
        alias lh='history'
        alias lmount='mount | column -t'

        # tail all logs
        alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

        alias grep='grep --color=auto'
        alias hgrep="history | grep "
        alias pgrep="ps aux | grep "
        alias mgrep="cat /var/log/messages | grep "
        alias sgrep="cat /var/log/secure | grep "
#        alias ping='ping -c 1'
        alias fping='ping -c 100 -s.2'
        alias ports='netstat -tulanp'

        alias df='df --human-readable --sync'
        alias cp='cp --recursive -d --preserve=all --verbose'
	alias mv='mv --verbose'
        alias j='jobs -l'
        alias c='clear'
        alias untar='tar -zxvf'

# FORMATTING  ###########################################

        # colored manpages
        export LESS_TERMCAP_mb=$'\E[01;31m'
        export LESS_TERMCAP_md=$'\E[01;31m'
        export LESS_TERMCAP_me=$'\E[0m'
        export LESS_TERMCAP_se=$'\E[0m'
        export LESS_TERMCAP_so=$'\E[01;44;33m'
        export LESS_TERMCAP_ue=$'\E[0m'
        export LESS_TERMCAP_us=$'\E[01;32m'

        export HISTFILESIZE=200000
        export HISTSIZE=100000
        shopt -s histappend
        # Combine multiline commands into one in history
        shopt -s cmdhist
        # Ignore duplicates, ls without options and builtin commands
        HISTCONTROL=ignoredups
        export HISTIGNORE="&:ls:[bf]g:exit"
        # append history instead of overwriting it
        shopt -s histappend
        PROMPT_COMMAND='history -a'

#########################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
