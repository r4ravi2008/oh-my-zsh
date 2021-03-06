autoload bashcompinit
bashcompinit
# Ifs you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws zsh-autosuggestions git colored-man-pages colorize docker github jira vagrant virtualenv tmux pip python brew osx zsh-syntax-highlighting vi-mode z)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/dev/go
export PATH="/usr/local/opt/scala@2.11/bin:$PATH"
export PATH="$HOME/dev/go/bin:$PATH"
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=/usr/local/aws/bin:$PATH
SPARK_HOME=~/dev/sdks/spark-2.3.3-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH
# export PYSPARK_PYTHON=python3
export PATH="$HOME/.cargo/bin:$PATH"
TERM=xterm-256color
export PATH=/usr/local/share/python:$PATH
# alias mvim='open -a /Applications/MacVim.app'
#alias mvim='mvim --remote-tab-silent'
alias vim='mvim'
EDITOR=vim


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Used to cd ls everytime directories are changed
function chpwd() {
    emulate -L zsh
    ls -ltr
}

function cdl {
    cd $(dirname $(readlink "$1"))
}

function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }
function mkcd() { mkdir -p "$@" && cd "$_"; }

alias zshconfig="$EDITOR ~/.zshrc"

function commands() {
  awk '{a[$4]++}END{for(i in a){print a[i] " " i}}'
}

alias topten="history | commands | sort -rn | head"
alias c="clear"

alias sshconfig="$EDITOR ~/.ssh/config" 
alias k=kubectl
complete -F __start_kubectl k
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
fpath+=${ZDOTDIR:-~}/.zsh_functions
