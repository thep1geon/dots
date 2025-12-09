# Standard stuff all bashrcs need or whatever
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prevent doublesourcing
if [[ -z "${BASHRCSOURCED}" ]] ; then
    BASHRCSOURCED="Y"
fi

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
fi

# House keeping
shopt -s autocd # Entering the name of a [relative] directory will cd into it
HISTSIZE= HISTFILESIZE= # Unlimited history >:)

# Aliases
alias l='ls -alh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Path Stuff
export ZVM_INSTALL="/home/magic/.zvm/self"
export PATH="/home/magic/.zvm/bin:$PATH"
export PATH="$ZVM_INSTALL:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

export EDITOR="nvim"

export _JAVA_AWT_WM_NONREPARENTING=1

# Prompt Stuff

# Colors
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
PURPLE="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"
BOLD_BLACK="\[\e[1;30m\]"
BOLD_RED="\[\e[1;31m\]"
BOLD_GREEN="\[\e[1;32m\]"
BOLD_YELLOW="\[\e[1;33m\]"
BOLD_BLUE="\[\e[1;34m\]"
BOLD_PURPLE="\[\e[1;35m\]"
BOLD_CYAN="\[\e[1;36m\]"
BOLD_WHITE="\[\e[1;37m\]"
NORMAL="\[\e[0m\]"

# Function to generate the exit code string
function set_prompt {
    local code=$?
    local exit_code=""
    if [[ $code -eq 0 ]]; then
        exit_code="${GREEN}$code${NORMAL}"
    else
        exit_code="${RED}$code${NORMAL}"
    fi

    PS1="${BLUE}󰣇${NORMAL}|$exit_code|${RED}\u${YELLOW}@${GREEN}\H${BLUE}:[\W]${PURPLE}\$${NORMAL} "
}

# Update PROMPT_COMMAND so it runs before each prompt to set EXIT_CODE_STR
PROMPT_COMMAND=set_prompt

PS2=">>> "
