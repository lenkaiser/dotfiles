export ZGEN_RESET_ON_CHANGE=($HOME/.zsh/zgen-setup.zsh)
source $HOME/.zgen/zgen.zsh

function load-plugin-list() {
    echo "creating a zgen save"
    ZGEN_LOADED=()
    ZGEN_COMPLETIONS=()

    zgen oh-my-zsh

    # If zsh-syntax-highlighting is bundled after zsh-history-substring-search,
    # they break, so get the order right.
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    #zgen load tymm/zsh-directory-history

    # Set keystrokes for substring searching
    zmodload zsh/terminfo
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down

    # Bind CTRL+k and CTRL+j to substring search
    #bindkey '^j' history-substring-search-up
    #bindkey '^k' history-substring-search-down

    # Tab complete rakefile targets
    #zgen load unixorn/rake-completion.zshplugin

    # Add my collection of miscellaneous utility functions.
    zgen load unixorn/jpb.zshplugin

    # Colorize the things if you have grc installed. Well, some of the
    # things, anyway.
    zgen load unixorn/warhol.plugin.zsh

    # OS X helpers. This plugin is smart enough to detect when it isn't running
    # on OS X and not load itself, so you can safely share the same plugin list
    # across OS X and Linux/BSD
    zgen load unixorn/tumult.plugin.zsh

    # Add my collection of git helper scripts
    zgen load unixorn/git-extra-commands

    # Add my bitbucket git helpers plugin
    zgen load unixorn/bitbucket-git-helpers.plugin.zsh

    # A collection of scripts that might be useful to sysadmins
    zgen load skx/sysadmin-util

    # Adds aliases to open your current repo & branch on github.
    zgen load peterhurford/git-it-on.zsh

    # Tom Limoncelli's tooling for storing private information (keys, etc)
    # in a repository securely by encrypting them with gnupg
    zgen load StackExchange/blackbox

    # Load some oh-my-zsh plugins
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/cp
    #zgen oh-my-zsh plugins/dircycle
    #zgen oh-my-zsh plugins/dirpersist
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/forklift
    zgen oh-my-zsh plugins/gem
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-hubflow
    zgen oh-my-zsh plugins/github
    zgen oh-my-zsh plugins/gnu-utils
    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/osx
    #zgen oh-my-zsh plugins/per-directory-history
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/pod
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/rbenv
    zgen oh-my-zsh plugins/rsync
    zgen oh-my-zsh plugins/ruby
    zgen oh-my-zsh plugins/safe-paste
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/themes
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/vi-mode

    # A set of shell functions to make it easy to install small apps and
    # utilities distributed with pip.
    zgen load sharat87/pip-app

    zgen load chrissicool/zsh-256color

    # Load more completion files for zsh from the zsh-lovers github repo
    zgen load zsh-users/zsh-completions src

    # Docker completion
    zgen load srijanshetty/docker-zsh

    # Load me last
    GENCOMPL_FPATH=$HOME/.zsh/complete

    # Very cool plugin that generates zsh completion functions for commands
    # if they have getopt-style help text. It doesn't generate them on the fly,
    # you'll have to explicitly generate a completion, but it's still quite cool.
    zgen load RobSis/zsh-completion-generator

    ## custom
    zgen load wbinglee/zsh-wakatime
    zgen load junegunn/fzf shell # Ctrl-t and Ctrl-r fzf bindings
    zgen load psprint/zsh-cmd-architect
    zgen load psprint/zsh-navigation-tools

    #zgen load chrissicool/zsh-bash
    #zgen load zsh-users/zaw
    zgen load Vifon/deer
    zgen load b4b4r07/enhancd
    zgen load fabiokiatkowski/exercism.plugin.zsh
    zgen load zdharma/fast-syntax-highlighting
    zgen load unixorn/git-extra-commands
    zgen load joepvd/zsh-hints
    #zgen load marzocchi/zsh-notify
    zgen load wuotr/zsh-plugin-vscode
    zgen load AlexisBRENON/oh-my-zsh-reminder
    #zgen load paulmelnikow/zsh-startup-timer
    zgen load sharat87/zsh-vim-mode
    zgen load laurenkt/zsh-vimto
    zgen load psprint/ztrace
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure
    #zgen load peterhurford/git-aliases.zsh

    # Add Fish-like autosuggestions to your ZSH
    zgen load zsh-users/zsh-autosuggestions

    # Save it all to init script
    zgen save
}

if ! zgen saved; then
    load-plugin-list
fi
