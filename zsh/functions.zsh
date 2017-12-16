# zsh check aliases
function _custom_check_aliases {
    IFS=$' '
    local found_aliases
    local found_aliases=()
    local best_match=""
    local v
    [[ -z "$(echo $1)" ]] && return
    local carr=($(echo $1))
    local c=${carr[@]:0:2}

    # Find alias matches
    for k in "${(@k)aliases}"; do
        v="${aliases[$k]}"

        if [[ $c =~ $v || $v =~ $c ]]; then
            found_aliases+="$k"

            # Match aliases to longest portion of command
            if [[ "${#v}" -gt "${#best_match}" ]]; then
                best_match="$k"
                # on equal length, choose the shortest alias
            elif [[ "${#v}" -eq "${#best_match}" && ${#k} -lt "${#best_match}" ]]; then
                best_match="$k"
            fi
        fi
    done 2>/dev/null
    [[ -z "$best_match" ]] && return
    echo "\033[1mBest alias found for \"${aliases[$best_match]}\". You should use: \"$best_match\"\033[00m"
    [[ ${#found_aliases} -eq 1 ]] && return 
    for k in ${(@ok)found_aliases:0:5}; do
        echo "\033[1mAnother alias for \"${aliases[$k]}\". You should use: \"$k\"\033[00m"
    done
    [[ ${#found_aliases} -gt 5 ]] && echo "\033[1...\033[00m" 
}

# Clean up the system
function _clean {
    echo 'Empty the Trash on all mounted volumes and the main HDD...'
    sudo rm -rfv /Volumes/*/.Trashes &>/dev/null
    sudo rm -rfv ~/.Trash &>/dev/null

    echo 'Clear System Log Files...'
    sudo rm -rfv /private/var/log/asl/*.asl &>/dev/null
    sudo rm -rfv /Library/Logs/DiagnosticReports/* &>/dev/null
    sudo rm -rfv /Library/Logs/Adobe/* &>/dev/null
    rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* &>/dev/null
    rm -rfv ~/Library/Logs/CoreSimulator/* &>/dev/null

    echo 'Clear Adobe Cache Files...'
    sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null

    echo 'Cleanup iOS Applications...'
    rm -rfv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null

    echo 'Remove iOS Device Backups...'
    rm -rfv ~/Library/Application\ Support/MobileSync/Backup/* &>/dev/null

    echo 'Cleanup XCode Derived Data and Archives...'
    rm -rfv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
    rm -rfv ~/Library/Developer/Xcode/Archives/* &>/dev/null

    echo 'Cleanup Homebrew Cache...'
    brew cleanup --force -s &>/dev/null
    brew cask cleanup &>/dev/null
    rm -rfv /Library/Caches/Homebrew/* &>/dev/null
    brew tap --repair &>/dev/null

    echo 'Cleanup any old versions of gems'
    gem cleanup &>/dev/null

    echo 'Cleanup Docker <none> images'
    docker rmi -f $(docker images -q --filter 'dangling=true')

    echo 'Purge inactive memory...'
    sudo purge
    echo 'Success!'
}

# Update the system
function _update {
    sudo -v
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    sudo softwareupdate -ia
    mas upgrade
    brew update
    brew upgrade
    brew cu -ay
    gem update
    gem update --system
    npm up -g
}

# Reset applications' settings
function _reset {
    function rr {
        echo "Removing $1"
        rm -rf $1
    }
    function rpref {
        rr ~/Library/Preferences/$1
    }
    function rcach {
        rr ~/Library/Caches/$1
    }
    function rcook {
        rr ~/Library/Cookies/$1
    }
    rpref com.surteesstudios.Bartender.plist
    rcach com.surteesstudios.Bartender
    rcook com.surteesstudios.Bartender.binarycookies
}

# Move c to $2 and create symbolic link of $2 in $1
function movelink {
    original="c" target="$2"
    if [ -d "$target" ]; then
        target="$target/${original##*/}"
    fi
    mv -- "$original" "$target"
    case "$original" in
        */*)
            case "$target" in
                /*) :;;
                *) target="$(cd -- "$(dirname -- "$target")" && pwd)/${target##*/}"
            esac
    esac
    ln -s -- "$target" "$original"
}

# Makes a directory and changes to it.
function mkdcd {
    [[ -n "c" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
    builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Pushes an entry onto the directory stack and lists its contents.
function pushdls {
    builtin pushd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Pops an entry off the directory stack and lists its contents.
function popdls {
    builtin popd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Prints columns 1 2 3 ... n.
function slit {
    awk "{ print ${(j:,:):-\$${^@}} }"
}

# Finds files and executes a command on them.
function find-exec {
    find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# Displays user owned processes status.
function psu {
    ps -U "${1:-$LOGNAME}" -o 'pid,%cpu,%mem,command' "${(@)argv[2,-1]}"
}

