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
    softwareupdate -d -a
    mas upgrade
    brew update
    brew upgrade
    brew cu -a -y
    gem update
    npm up -g
}

# Move $1 to $2 and create symbolic link of $2 in $1
function movelink {
    original="$1" target="$2"
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
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
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

