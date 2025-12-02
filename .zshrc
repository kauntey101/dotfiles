# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# custom zsh init file 
# link : https://youtu.be/ud7YxC33Z3w?si=5UBI61UcWVL1ljII

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# custom config 
SHELL_INCLUDES="$HOME/.config/shell/"

# tmux 
. "$SHELL_INCLUDES/tmux-startup"

# aliasses 
. "$SHELL_INCLUDES/aliasses"

# exports
. "$SHELL_INCLUDES/exports"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings 
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# --- Ctrl + Arrow Keys ---
# Move by big words (Emacs-style)
bindkey "^[[1;5D" backward-word      # Ctrl + Left
bindkey "^[[1;5C" forward-word       # Ctrl + Right


# History settings 
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# setting history options
setopt appendhistory    # append history rather than overwriting 
setopt sharehistory     # share the history between every instance of the terminal 
setopt hist_ignore_space    # don't save commands that start with a space in history 
setopt hist_ignore_all_dups # ignore duplicates when browsing commands history  
setopt hist_save_no_dups    
setopt hist_ignore_dups 
setopt hist_find_no_dups

# completion styling 
# set colors to directory and files autocompletion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
