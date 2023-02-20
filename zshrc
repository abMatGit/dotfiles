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
plugins=(git brew gem macos)

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
alias cdrails="cd ~/workspace/basilisk"
alias av="aws-vault exec amat-dev -- "

function aptible_login() {
  aptible login --email=andy.matuszewski@hingehealth.com --lifetime=7d --password=$(lpass show --url aptible.com --password)
}

function aws_login() {
  aws-vault exec $(aws-vault list | fzf | awk '{print $1}')
}

function fbd() {
  git branch | fzf | xargs git branch -D
}

# ------------------------- SECURITY THINGS  ---------------------------
# Storing secrets through macos keychain: https://reyes.im/blog/2020-09-18-how-to-keep-your-environment-variables-safe/
export GITHUB_ACCESS_TOKEN=$(security find-generic-password -s "GITHUB_ACCESS_TOKEN" -w amat.keychain-db)
export BUNDLE_GEMS__CONTRIBSYS__COM=$(security find-generic-password -s "BUNDLE_GEMS__CONTRIBSYS__COM" -w amat.keychain-db)
export BUNDLE_RUBYGEMS__PKG__GITHUB__COM="_:${GITHUB_ACCESS_TOKEN}"

# ------------------------- HOME THINGS -------------------------
alias twitch="livestreamer --http-header Client-ID=ewvlchtxgqq88ru9gmfp1gmyt6h2b93 $1 $2"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
