# Git Display on Terminal
source $HOME/personal/bash_config/git-completion.bash
source $HOME/personal/bash_config/git-prompt.sh

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[1;37m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$LIGHT_GRAY"\u@\h"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$WHITE" \w"$LIGHT_GRAY"$ "

# General Bash aliases
alias ll='ls -lhF'
alias lh='ls -lah'
alias sbrc='source ~/.bashrc'
alias ..='cd ..'
alias deprox='. $HOME/personal/deproxify_temporarily.sh'

# Git aliases
alias gg='git status -s'
alias gits='git status'
alias gitka='gitk --all &'
alias gitr='git remote -v'
alias gitsui='git submodule update --init --recursive'
alias gitssync='git submodule sync'
alias gitcm='git commit -m'
alias gitcam='git commit -am'
alias gitum='git fetch origin master:master'

# Misc
alias m='meld'
alias nm='nm -C'
alias run_sim='launch_control.py motion_planning_sim'

# Workspace/Compile etc...
alias cb='catkin build'
alias cbsc='catkin build -sc'
alias cbn='catkin build --no-deps'
alias ccy='catkin clean -y'
alias cbdevel='catkin build mops_development'
alias crt='catkin run_tests'
alias crtn='catkin run_tests --no-deps'
alias cda='cd ~/workspace/athena'
alias cdf='cd ~/workspace/athena/src/fusion'
alias cds='cd ~/workspace/athena/src/'
alias cddevm='cd ~/workspace/athena/devel/lib/mops'
alias sclangbuild='source $HOME/workspace/athena/devel/setup.bash'

# Overwrite specific path executables
#alias clang-format='/usr/bin/clang-format-3.9'

# Core Dumps
ulimit -c unlimited

# Running Apps
alias plattfusgrid='rosbag play --clock --pause /fusion/FusionDynamicWorldService/0/DynamicWorld:=/rec/fusion/FusionDynamicWorldService/0/DynamicWorld \
/fusion/FusionTrafficLightService/0/FusionTrafficLightInterface:=/rec/fusion/FusionTrafficLightService/0/FusionTrafficLightInterface'

alias plattfus='plattfusgrid \
/fusion/FusionDynamicWorldService/internal_grid_fusion/DynamicWorld:=/rec/fusion/FusionDynamicWorldService/internal_grid_fusion/DynamicWorld \
/fusion/FusionStaticWorldService/internal_grid_fusion/StaticWorld:=/rec/fusion/FusionStaticWorldService/internal_grid_fusion/StaticWorld '

# History management
export HISTFILE=$HOME/personal/bash_config/bash_history

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

HISTSIZE=999999
HISTFILESIZE=999999

HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
