mi() {
    curl cheat.sh/$1
}

gitpush() {
    git add .
    git commit -m "$*"
    git pull
    git push
}

scss_template() {
    gh repo clone scss_template
    mv scss_template scss

    case "$1" in
    e) ;;
    *) rf scss/.git ;;
    esac
}

site_template() {
    gh repo clone site_template
    mv site_template site

    case "$1" in
    e) ;;
    *) rf site/.git ;;
    esac
}

# make a dir and cd into it
take() {
    mkd $1 && cd $1
}

search_tweets() {
    TWEET_FILE=~/Documents/.backups/twitter/edwardspresume/data/tweets.js

    grep -ni --color=always $1 $TWEET_FILE | awk '{print $0,"\n"}'
    #grep -ni $1 $TWEET_FILE | awk '{print "\033[33m" $0 "\033[39m \n"}'

}

searchman_flag() {
    man $1 | grep -A2 " -$2"
    # man $1 | col -b | grep -A5 -- "-$2"
    # LESS=+/"-$2" man "$1"
}
