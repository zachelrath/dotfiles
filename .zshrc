# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/zachelrath/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="gallois"
# ZSH_THEME="muse"
ZSH_THEME="theunraveler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git autoenv)

source $ZSH/oh-my-zsh.sh

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

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias dc='docker-compose'
alias dcup='docker-compose up -d'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Visual\ Studio\ Code"
alias mb="make build"
alias mbw="make build-and-watch"
alias mw="make watch"
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias bf='gf && gco master && gl && make SOURCE=$(glol --first-parent master | head -1 | cut -d" " -f2) TARGET=spark-u3-release backfill'
alias soql='sfdx force:data:soql:query --query'
alias soqlj='sfdx force:data:soql:query --json --query'
alias apx='sfdx force:apex:test:run --synchronous --classnames'
alias devorg='sfdx force:config:set --defaultusername zach@skuid.dev'

function gitkill() {
	git push origin --delete $1 && git branch -d $1
}

# Z - for navigating around really fast
# . /usr/local/bin/z.sh

export MYGITDIR=/usr/local/bin/git-commands
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/usr/local/lib/node_modules/eslint/bin:$PATH"
export PATH="/usr/local/bin:$PATH:$MYGITDIR"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export JAVA_HOME=$(/usr/libexec/java_home)

# NVM
export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"

nvm use 12.18.1

eval "$(ssh-agent -s)"

source /usr/local/opt/autoenv/activate.sh

export CHROME_BIN='/Applications/Chromium.app/Contents/MacOS/Chromium'
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD='true'

# sfdx autocomplete setup
SFDX_AC_ZSH_SETUP_PATH=/Users/zachelrath/Library/Caches/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH;

# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
# 

# MUST BE LAST
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
