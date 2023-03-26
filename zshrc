# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Define path for custom zsh configure dir
ZSH_CONFIG_DIR="$HOME/.zsh"

# Define path for fzf dir
FZF_DIR="/usr/share/fzf"

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


source_file_if_exists "$ZSH_CONFIG_DIR/config.zsh"    # General zsh configuration
source_file_if_exists "$ZSH_CONFIG_DIR/aliases.zsh"   # Customized aliases
source_file_if_exists "$ZSH_CONFIG_DIR/functions.zsh" # Customized functions

source_file_if_exists "$FZF_DIR/completion.zsh"              # Enable command line completion for fzf
source_file_if_exists "$FZF_DIR/key-bindings.zsh"            # Key bindings for easier navigation and usage of fzf
source_file_if_exists "$HOME/.config/broot/launcher/bash/br" # Source broot launcher for easier directory navigation with broot

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

source_file_if_exists "$ZSH_CONFIG_DIR/powerlevel10k/powerlevel10k.zsh-theme" # Powerlevel10k theme for customized prompt appearance and features

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
