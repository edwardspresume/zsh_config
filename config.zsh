# Globbing and expansion options
setopt extendedglob       # Allows using regular expressions with *
setopt nocaseglob         # Case insensitive globbing
setopt rcexpandparam      # Enables array expansion with parameters
setopt numericglobsort    # Sort filenames numerically when it makes sense

# History options
setopt extended_history       # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history     # Write to the history file immediately, not when the shell exits.
setopt share_history          # Share history between all sessions.
setopt hist_beep              # Beep when accessing nonexistent history.
setopt hist_expire_dups_first # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups       # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups      # Do not display a line previously found.
setopt hist_ignore_space      # Don't record an entry starting with a space.
setopt hist_save_no_dups      # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks     # Remove superfluous blanks before recording entry.
setopt hist_verify            # Don't execute immediately upon history expansion.

# Miscellaneous options
setopt correct            # Automatically corrects spelling mistakes
setopt autocd             # Allows changing to a directory by typing its name
setopt nomatch            # Generates an error message when no matches are found
setopt notify             # Reports status of background jobs immediately
setopt nocheckjobs        # Does not warn about running processes when exiting
setopt bang_hist          # Treats the '!' character specially during expansion.


CASE_SENSITIVE="false"      # Configures case sensitivity for command line completion
HYPHEN_INSENSITIVE="true"   # Configures hyphen sensitivity for command line completion


# Load the Zsh completion system with the colors and zcalc modules
autoload -Uz compinit colors zcalc
compinit -d  # Initialize the completion system
colors  # Load the color definitions


# Enable case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Enable colored completion with different colors for directories, files, etc.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Automatically find new executables in the path for completions
zstyle ':completion:*' rehash true

# Speed up completions by accepting exact matches and caching completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Set the completion menu to select mode
zstyle ':completion:*' menu select


eval "$(zoxide init zsh)"   # Initializes the zoxide shell integration; better alternative to cd


## History file settings
HISTFILE=~/.zsh/history.zsh
HISTSIZE=999999    # Maximum number of entries that are kept in a session
SAVEHIST=999999    # Maximum number of entries that will be saved to the history file after each session
HISTFILESIZE=999999 # Maximum size of the history file


# Word character settings
WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word


## Keybindings section
bindkey -e   # Enable emacs keybindings

# Home key
bindkey '^[[7~' beginning-of-line       # VT100 (and most other terminals)
bindkey '^[[H' beginning-of-line        # xterm

# [Home] - Go to beginning of line
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi

# End key
bindkey '^[[8~' end-of-line             # VT100 (and most other terminals)
bindkey '^[[F' end-of-line              # xterm

# [End] - Go to end of line
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line
fi

bindkey '^[[2~' overwrite-mode                      # Insert key
bindkey '^[[3~' delete-char                         # Delete key
bindkey '^[[C'  forward-char                        # Right key
bindkey '^[[D'  backward-char                       # Left key
bindkey '^[[5~' history-beginning-search-backward   # Page up key
bindkey '^[[6~' history-beginning-search-forward    # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                         # ctrl+right
bindkey '^[Od' backward-word                        # ctrl+left
bindkey '^[[1;5D' backward-word                     # ctrl+shift+left
bindkey '^[[1;5C' forward-word                      # ctrl+shift+right

bindkey '^H' backward-kill-word                     # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                 # Shift+tab undo last action


## Plugins section
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Offer to install missing package if command is not found
if [[ -r /usr/share/zsh/functions/command-not-found.zsh ]]; then
    source /usr/share/zsh/functions/command-not-found.zsh
    export PKGFILE_PROMPT_INSTALL_MISSING=1
fi


# Color man pages
# Set terminal colors for less pager
export LESS_TERMCAP_mb=$'\E[01;32m'    # Begin blinking mode
export LESS_TERMCAP_md=$'\E[01;32m'    # Begin bold mode
export LESS_TERMCAP_me=$'\E[0m'        # End all modes
export LESS_TERMCAP_se=$'\E[0m'        # End standout mode
export LESS_TERMCAP_so=$'\E[01;47;34m' # Begin standout mode
export LESS_TERMCAP_ue=$'\E[0m'        # End underline mode
export LESS_TERMCAP_us=$'\E[01;36m'    # Begin underline mode
export LESS=-R                          # Enable interpreting ANSI color escape sequences
