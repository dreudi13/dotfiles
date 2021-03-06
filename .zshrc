# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

PATH=$PATH:$HOME/.composer/vendor/bin

setopt correct

DEFAULT_USER="jason"

# Path to your oh-my-zsh installation.
export ZSH=/home/jason/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="dreudi13"
ZSH_THEME="muse"
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PHP_SHOW=false

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    wp-cli
    git
    sudo
    warhol
)

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Alias
alias t="./vendor/bin/phpunit"
alias cs="./vendor/bin/phpcs"
alias cbf="./vendor/bin/phpcbf"
alias csf="./vendor/bin/php-cs-fixer"
alias phpspec="./vendor/bin/phpspec"

alias pac="phpactor"

alias mys="mysql -u root -p"

alias phps="php -S localhost:8000 -d display_errors=1"

alias crdir="create_directories.py"
alias eadi="easy_dir.py"

alias lab="cd ~/Lab/"
alias labphp="cd ~/Lab//php/"
alias sites="cd ~/Sites/"
alias coc="cd ~/Lab/coalition-of-code"

# Symfony Alias
alias sf="bin/console"
alias sfmigrate="sf doctrine:migrations:migrate"
alias sfmigrate_d="sfmigrate --dry-run"
alias sflex="composer req"
alias sfentity="bin/console make:entity"
alias sfserve="bin/console server:run"
alias api-generate-client="./node_modules/.bin/generate-api-platform-client"

# Docker Alias
alias docke="docker-compose exec"
alias dockr="docker-compose run"
alias dock="docker-compose"
alias docks="docker-compose stop"
alias dockd="docker-compose down"
alias docku="docker-compose up"
alias dockud="docker-compose up -d"
alias dockb="docker-compose --build"
alias dockub="docker-compose up --build"
alias dockudb="docker-compose up -d --build"
# Composer Container
alias dock_composer="docker run --rm --interactive --tty --volume $PWD:/application --user $UID:$GID"
