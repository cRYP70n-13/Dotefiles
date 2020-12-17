# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/okimdil/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker npm dotenv zsh-autosuggestions kubectl docker-compose github aws ansible rails boot2docker docker-machine dotenv emoji golang heroku minikube node yarn postgres terraform gitignore)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi


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
#
# problem: when presenting, I want to obscure
# my prompt to act like it's at root of file system
# and be very basic with no git info, etc.

# solution: this theme lets you set a ENV to the path
# of your presentation, which will help remove unneeded prompt
# features while in that path

# oh-my-zsh theme for presenting demos
# based off the default rubbyrussell theme
# save this in .oh-my-zsh/custom/themes/present.zsh-theme
# then make this your default theme in .zshrc and it will
# act normal until you set the ENV VAR 'PRESENT' to a full path
# to the folder you want to present from. This will then hide
# the current working dir name in your prompt while in that dir only
# and hide the git_prompt for it and all subdirs
# mine has a whale emote for all things docker
# simply unset the PRESENT to clear config
# example:
# cd path/to/my/code/repo/for/presentation
# export PRESENT=$(PWD)


# if PRESENT has been set, lets show whale
# if not, DAY DRINKING!
function whale_or_bourbon () {
    if [[ -z $PRESENT ]]; then
        # 256 color with ;1m for bold %{\e[38;5;45;1m%}
        # https://wiki.archlinux.org/index.php/zsh#Colors
        # http://jafrog.com/2013/11/23/colors-in-terminal.html
        # https://misc.flogisoft.com/bash/tip_colors_and_formatting
        # also note that any error code from last command will result in
        # fire rather then bourbon
        echo -n "%(?:🥃 :🔥 )"
        echo -n "%{$fg_bold[blue]%}%c%{$reset_color%} $(git_prompt_info)"
    else
        # note that I've had feedback that people seeing fire
        # while I'm in demo mode is off-putting so I've disabled it
        # here by default, but swap out the next two lines to enable it
        # echo -n "%(?:🐳 :🔥 )"
        echo -n "🐳 "
        # if we're in the root of presentation, hide the path
        if [[ ! $PWD == $PRESENT ]]; then
            echo -n "%{$fg_bold[blue]%}%c%{$reset_color%} "
        fi
    fi
}

# The code extension
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

PROMPT='$(whale_or_bourbon)'
#default
# PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}💍"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# OPTIONAL BONUS: let this theme set this alias, then whenever you need to present,
# just cd to the path you're presenting from and type `present` 💥
#alias present='export PRESENT=$(pwd)'
export PATH=$HOME/.brew/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=$HOME/.brew/bin:$PATH

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/okimdil/.brew/bin/terraform terraform
