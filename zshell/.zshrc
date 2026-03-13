# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira-local3"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

export EDITOR=nvim

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
#autoload -Uz add-zsh-hook
#add-zsh-hook precmd  _kitty_tab_title
#add-zsh-hook preexec _kitty_tab_cmd

#_kitty_tab_title() { print -Pn "\e]0;%1~\a" }           # shows current dir
#_kitty_tab_cmd()   { print -Pn "\e]0;$1\a" }            # shows command e.g. nvim
# Uncomment the following line to enable command auto-correction.

DISABLE_MAGIC_FUNCTIONS=true
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# =========================
# Autosuggestions style
# =========================
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'  # Gray text
#ZSH_HIGHLIGHT_STYLES[command]='fg=cyan,bold'
#ZSH_HIGHLIGHT_STYLES[function]='fg=yellow'
#ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[parameter]='fg=magenta'      # Parameters
#ZSH_HIGHLIGHT_STYLES[suffix]='fg=red,bold'

# =========================
# Autosuggestions
# =========================
# Must come AFTER OMZ
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# =========================
# History Settings
# =========================
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# =========================
# Command Completion
# =========================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case-insensitive
setopt MENU_COMPLETE                                  # Tab menu
setopt CORRECT                                       # Auto-correct typos


# =========================
# Enable colors
# =========================
autoload -U colors && colors

# =========================
# Syntax Highlighting
# =========================
# Must be LAST
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Directory color while typing
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'

alias ll='ls -lah'
alias vi='nvim'
export PATH=$HOME/.local/bin:$PATH

alias docker-disable='sudo systemctl stop docker.socket && sudo systemctl disable docker.socket && sudo systemctl stop docker && sudo systemctl disable docker && sudo systemctl stop containerd && sudo systemctl disable containerd'

alias docker-enable='sudo systemctl start docker.socket && sudo systemctl start docker && sudo systemctl start containerd'

# ThinkPad battery threshold control
batlimit() {
  sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold <<< 30 >/dev/null
  sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold   <<< 85 >/dev/null
  echo "🔋 Battery limited to 30% → 85%"
}

batfull() {
  sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold <<< 0   >/dev/null
  sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold   <<< 85 >/dev/null
  echo "🔌 Battery limit disabled (0% → 100%)"
}

batnoc() {
  sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold <<< 101 >/dev/null
  sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold   <<< 101 >/dev/null
  echo "⛔ Battery charging disabled"
}

zle_highlight=('paste:none')
bindkey -v
bindkey "^?" backward-delete-char

# =========================
# NVM - Lazy Load (fast)
# =========================
# export NVM_DIR="$HOME/.nvm"

# Lazy load nvm - only loads when you first call nvm, node, npm, npx, etc.
#nvm() {
#    unset -f nvm node npm npx yarn pnpm
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#    nvm "$@"
#}
#node() { nvm; node "$@"; }
#npm()  { nvm; npm "$@"; }
#npx()  { nvm; npx "$@"; }
#yarn() { nvm; yarn "$@"; }
#pnpm() { nvm; pnpm "$@"; }


# Fast NVM Lazy Loader (No loops, no freezing)
export NVM_DIR="$HOME/.nvm"

lazy_load_nvm() {
  unset -f node npm npx gemini  # Add 'gemini' here
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# These "aliases" trigger the loader the first time you use them
node() { lazy_load_nvm; node "$@"; }
npm() { lazy_load_nvm; npm "$@"; }
npx() { lazy_load_nvm; npx "$@"; }
gemini() { lazy_load_nvm; gemini "$@"; }


#export LS_COLORS='di=1;34:ln=1;36:ex=1;32:fi=0;37'
export KITTY_SHELL_INTEGRATION="enabled"
eval "$(zoxide init zsh)"
alias ollama='/media/anis/TOSHIBA/ollama/run.sh'



