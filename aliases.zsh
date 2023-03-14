# ZSH files
alias sz="source $ZSH_CONFIG_DIR/zshrc"  # Reload .zshrc
alias nzsh="nano $ZSH_CONFIG_DIR/zshrc"  # Edit zshrc file
alias nzsha="nano $ZSH_CONFIG_DIR/aliases.zsh"  # Edit aliases.zsh file
alias nzshf="nano $ZSH_CONFIG_DIR/functions.zsh"  # Edit functions.zsh file
alias czsh="code  $ZSH_CONFIG_DIR/.zshrc"  # Open .zshrc file in Visual Studio Code
alias czsha="code $ZSH_CONFIG_DIR/aliases.zsh"  # Open aliases.zsh file in Visual Studio Code
alias czshf="code $ZSH_CONFIG_DIR/functions.zsh"  # Open unctions.zsh file in Visual Studio Code

# General
alias p='pnpm'  # Alias for 'pnpm' package manager
alias r='reset'  # Alias for 'reset' command
alias h='history -E'  # Display command history without line numbers
alias o='xdg-open'  # Open a file or URL using the default application
alias g='grep --colour=auto'  # Add color to grep output
alias sbb='sudo $(fc -ln -1)'  # Run the last command with sudo
alias dbe='mycli -u ed -p 0000'  # Login to MariaDB with username and password

# Files & folders
alias l='lsd'  # List files and directories in the current directory
alias ll='lsd -l'  # List files and directories in long format
alias la='lsd -la'  # List all files and directories, including hidden ones
alias ln= 'ln -s'  # Create soft symbolic links
alias less='less -F'  # Quit automatically when displaying the last page

# Find files and folders
alias f="fzf"  # Fuzzy search for files and folders
alias fp="fzf --preview 'bat --style=numbers --color=always {}'"  # Preview files in 'bat' before opening in fzf
alias cp='cp -i'  # Copy files with confirmation
alias mv='mv -i'  # Move files with confirmation
alias rf='trash'  # Move files to the trash instead of deleting them
alias diff='delta'  # Highlight diff in 'git diff' output
# alias rd='rm -frvI'  # Remove directories and files with confirmation
alias mkd='mkdir -pv'  # Create directories and print a message if successful


# Admin
alias chown='sudo chown'

# Pacman
alias pi='sudo pacman -Syu'  # Update the package database and upgrade the system
alias pu='sudo pacman -Runs'  # Remove a package and its dependencies

# System
alias i='tldr'  # Alternative way to access 'tldr' command
alias top='btop'  # Alternative to 'top' command
alias ps='procs'  # Alternative to 'ps' command
alias sdn='sudo shutdown now'  # Shutdown the system immediately
alias df='duf'  # Alternative to 'df' command
alias du='gdu'  # Alternative to 'du' command
alias free='free -m'  # Show memory sizes in megabytes
alias avu='sudo freshclam'  # Update ClamAV virus definitions
alias avs='sudo clamscan -r --bell'  # Scan the system with ClamAV antivirus

# Log
alias llog='$PAGER /var/log/syslog || journalctl'     # View syslog in pager or use journalctl
alias llogt="less +F /var/log/httpd/local-test.com-access_log" # View apache access log in less with follow mode


# Git aliases
alias gg='lazygit'                        # Git GUI for terminal
alias gl='git pull'                       # Fetch and merge changes from remote branch
alias gp='git push'                       # Push changes to remote branch
alias gpu='git push origin `git branch --show-current`'   # Push changes to current branch
alias gb='git branch'                     # List branches
alias gbd='git branch -D'                 # Delete branch
alias gst='git status -sb'                # Show the working tree status in short format
alias gcm='git commit -m'                 # Record changes to the repository with a message
alias gcl='gh repo clone'                 # Clone a GitHub repository
alias gco='git checkout'                  # Switch branches or restore working tree files
alias gcob='git checkout -b'              # Create and switch to a new branch
alias gcot='git checkout -t'              # Create and switch to a new branch tracking a remote branch
alias gcof='git checkout --'              # Discard changes in the working directory
alias gim='git merge'                     # Join two or more development histories together
alias glog='git log'                      # Show commit logs
alias glog1='git log --oneline'           # Show commit logs in one line
alias glogp='git log --pretty=format:"%h %s" --graph'   # Show commit logs in a graph format
alias reset-master='git reset --hard origin/master'    # Reset the current branch to the latest commit on origin/master
alias grh='git reset --hard origin/`git branch --show-current`'    # Reset the current branch to the latest commit on its remote counterpart
alias gstash='git stash'                  # Stash changes in a dirty working directory
alias gstashl='git stash list'            # List stashes
alias gstashs='git stash show'            # Show a specific stash
alias gstashd='git stash drop'            # Delete a specific stash
alias ga='git add'                        # Add file contents to the index
alias gaa='git add .'                     # Add all files to the index
alias gd='git diff'                       # Show changes between commits, commit and working tree, etc


# Old aliases
# alias l='exa --icons'
# alias ll='exa -l --icons'
# alias la='exa -la --icons'
# alias ip='curl icanhazip.com'        # Your public IP address
