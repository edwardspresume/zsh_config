# Define path for Powerlevel10k instant prompt
P10K_INSTANT_PROMPT_SOURCE="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Define path for custom zsh configure dir
ZSH_CONFIG_DIR="$HOME/.zsh"

# Define path for fzf dir
FZF_DIR="/usr/share/fzf"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$P10K_INSTANT_PROMPT_SOURCE" ]]; then
  source "$P10K_INSTANT_PROMPT_SOURCE"
fi

# Function to source a file if it exists
# This function takes a file path as an argument and sources it if the file exists.
source_file_if_exists() {
  local file="$1"
  if [[ -f "$file" ]]; then
    source "$file"
  else
    # If the file doesn't exist, it prints an error message to stderr.
    printf "Error: %s not found\n" "$file" >&2
  fi
}

source_file_if_exists "$ZSH_CONFIG_DIR/.p10k.zsh" # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source_file_if_exists "$ZSH_CONFIG_DIR/powerlevel10k/powerlevel10k.zsh-theme" # Powerlevel10k theme for customized prompt appearance and features

source_file_if_exists "$ZSH_CONFIG_DIR/config.zsh"    # General zsh configuration
source_file_if_exists "$ZSH_CONFIG_DIR/aliases.zsh"   # Customized aliases
source_file_if_exists "$ZSH_CONFIG_DIR/functions.zsh" # Customized functions

source_file_if_exists "$FZF_DIR/completion.zsh"              # Enable command line completion for fzf
source_file_if_exists "$FZF_DIR/key-bindings.zsh"            # Key bindings for easier navigation and usage of fzf
source_file_if_exists "$HOME/.config/broot/launcher/bash/br" # Source broot launcher for easier directory navigation with broot
