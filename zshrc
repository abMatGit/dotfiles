# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aMatNebirhos"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew-cask brew gem osx)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

#########  ------------ PATH ---------- #########
#
export PATH="$(npm bin):/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
#
##################################

############# EXPORTS #############

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ---------- PRE-COMMAND RUNS ----------
eval "$(rbenv init -)"

# ZSH ENVIRONMENT VARIABLES
ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

brewdeps() {
  brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
}

brewuses() {
  brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew uses --installed $cask | awk '{printf(" %s ", $0)}'; echo ""; done
}

show_running_ports() {
  lsof -iTCP -sTCP:LISTEN
}

alias L="cd ~/workspace/git-repos/"
alias ls="ls -G -l"
alias mpv="mpv $1 -cache=20000"
alias vim="nvim"

# ------------------------- WORKSPACE THINGS ---------------------------
alias cdrails="cd ~/workspace/lumos_rails"
export SHOP_SCHEMA_LOADED="true"
source <(kubectl completion zsh)

# -------------------------- KUBECTL ALIAS SETTINGS ---------------------
alias k=kubectl
alias kcu='kubectl config use-context' # kcu <context name>
alias kcc='kubectl config current-context'
# List all Nodes
alias kgn="kubectl-1.6 get nodes --output=wide --sort-by='.metadata.labels.kubernetes\.io\/role' -L kubernetes.io/role -L lumoslabs.com/workload"
# List all Pods
alias kgpa="kubectl-1.6 get pods --all-namespaces --output=wide --sort-by='.metadata.namespace'"
alias kgp="kubectl-1.6 get pods --output=wide --sort-by='.metadata.namespace'"
# List all Deployments
alias kgd="kubectl-1.6 get deployments --all-namespaces --output=wide --sort-by='.metadata.namespace'"
# List all Services
alias kgs="kubectl-1.6 get services --all-namespaces --output=wide --sort-by='.metadata.namespace'"
# List all Ingresses
alias kgi="kubectl-1.6 get ingress --all-namespaces --output=wide --sort-by='.metadata.namespace'"
# Exec into the pod
kexec() {
  kubectl exec -it $1 -- /bin/bash
}

# ------------------------- HOME THINGS -------------------------
alias twitch="livestreamer --http-header Client-ID=ewvlchtxgqq88ru9gmfp1gmyt6h2b93 $1 $2"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
