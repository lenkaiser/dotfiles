export ZGEN_RESET_ON_CHANGE=($HOME/.zsh/zgen-setup.zsh)
source $HOME/.zgen/zgen.zsh

function load-plugin-list() {
    echo "creating a zgen save"

    ZSH_THEME=refined
    ZGEN_LOADED=()
    ZGEN_COMPLETIONS=()

    zgen oh-my-zsh

    # If zsh-syntax-highlighting is bundled after zsh-history-substring-search,
    # they break, so get the order right.
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # Set keystrokes for substring searching
    #bindkey '^[[A' history-substring-search-up
    #bindkey '^[[B' history-substring-search-down
    zgen load iam4x/zsh-iterm-touchbar

    zgen load wbinglee/zsh-wakatime

    zgen load joepvd/zsh-hints
    zgen load Vifon/deer
    zgen load b4b4r07/enhancd
    zgen load fabiokiatkowski/exercism.plugin.zsh

    # OS X helpers. This plugin is smart enough to detect when it isn't running
    # on OS X and not load itself, so you can safely share the same plugin list
    # across OS X and Linux/BSD
    zgen load unixorn/tumult.plugin.zsh

    # Add my collection of git helper scripts
    zgen load unixorn/git-extra-commands

    # Add my bitbucket git helpers plugin
    #zgen load unixorn/bitbucket-git-helpers.plugin.zsh

    # Adds aliases to open your current repo & branch on github.
    zgen load peterhurford/git-it-on.zsh

    # Tom Limoncelli's tooling for storing private information (keys, etc)
    # in a repository securely by encrypting them with gnupg
    #zgen load StackExchange/blackbox

    # Load some oh-my-zsh plugins
    #zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/cabal
    zgen oh-my-zsh plugins/cargo
    zgen oh-my-zsh plugins/colorize
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/compleat
    zgen oh-my-zsh plugins/copybuffer
    zgen oh-my-zsh plugins/copydir
    zgen oh-my-zsh plugins/copyfile
    zgen oh-my-zsh plugins/cp
    zgen oh-my-zsh plugins/dircycle
    zgen oh-my-zsh plugins/dirpersist
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/forklift
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/git-flow
    zgen oh-my-zsh plugins/git-hubflow
    zgen oh-my-zsh plugins/git-hubflow
    zgen oh-my-zsh plugins/git-prompt
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/github
    zgen oh-my-zsh plugins/gitignore
    zgen oh-my-zsh plugins/globalias
    zgen oh-my-zsh plugins/gnu-utils
    zgen oh-my-zsh plugins/history
    #zgen oh-my-zsh plugins/history-substring-search
    zgen oh-my-zsh plugins/iterm2
    zgen oh-my-zsh plugins/jsontools
    zgen oh-my-zsh plugins/last-working-dir
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/per-directory-history
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/safe-paste
    zgen oh-my-zsh plugins/swiftpm
    zgen oh-my-zsh plugins/thefuck
    zgen oh-my-zsh plugins/themes
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/web-search
    zgen oh-my-zsh plugins/xcode
    zgen oh-my-zsh plugins/zsh-navigation-tools
    zgen oh-my-zsh plugins/zsh_reload

    # A set of shell functions to make it easy to install small apps and
    # utilities distributed with pip.
    zgen load sharat87/pip-app

    zgen load chrissicool/zsh-256color

    # Load more completion files for zsh from the zsh-lovers github repo
    zgen load zsh-users/zsh-completions src

    # Very cool plugin that generates zsh completion functions for commands
    # if they have getopt-style help text. It doesn't generate them on the fly,
    # you'll have to explicitly generate a completion, but it's still quite cool.
    zgen load RobSis/zsh-completion-generator

    ## custom
    #zgen load junegunn/fzf shell # Ctrl-t and Ctrl-r fzf bindings
    #zgen load psprint/zsh-cmd-architect
    #zgen load psprint/zsh-navigation-tools

    #zgen load chrissicool/zsh-bash
    #zgen load zsh-users/zaw
    #zgen load unixorn/git-extra-commands
    #zgen load marzocchi/zsh-notify
    #zgen load wuotr/zsh-plugin-vscode
    #zgen load AlexisBRENON/oh-my-zsh-reminder
    #zgen load paulmelnikow/zsh-startup-timer
    #zgen load sharat87/zsh-vim-mode
    #zgen load laurenkt/zsh-vimto
    #zgen load psprint/ztrace
    #zgen load peterhurford/git-aliases.zsh

    # Load me last
    GENCOMPL_FPATH=$HOME/.zsh/complete

    # Add Fish-like autosuggestions to your ZSH
    zgen load zsh-users/zsh-autosuggestions

    # Save it all to init script
    zgen save
}

autoload -U deer
zle -N deer
bindkey '\ek' deer

zle -N znt-cd-widget
bindkey "^A" znt-cd-widget
zle -N znt-kill-widget
bindkey "^Y" znt-kill-widget

if ! zgen saved; then
    load-plugin-list
fi
