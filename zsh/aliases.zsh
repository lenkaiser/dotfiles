alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

if which mmake >/dev/null 2>&2; then
    alias make='mmake'
fi

if which exa >/dev/null 2>&1; then
    alias ls='exa'
    alias l='exa -la --git'
    alias la="exa -abghl --git"
    alias ll='exa -l --git'
fi

alias man="mand"
alias reload=". $HOME/.zshrc"

alias killaudio='sudo killall -m -9 coreaudio'
alias atom=atom-beta
alias pip=pip2
alias v=vim
alias vi=vim
alias cat=ccat
alias top="vtop"
alias oldtop="/usr/bin/top"
alias pbc='pbcopy'
alias pbp='pbpaste'
alias _='sudo'
alias b='${(z)BROWSER}'

alias diffu="diff --unified"
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias sa='alias | grep -i'
alias type='type -a'

if [[ "$OSTYPE" == (darwin*|*bsd*) ]]; then
  alias topc='top -o cpu'
  alias topm='top -o vsize'
else
  alias topc='top -o %CPU'
  alias topm='top -o %MEM'
fi

# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

# Mac OS X Everywhere
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
elif [[ "$OSTYPE" == cygwin* ]]; then
  alias o='cygstart'
  alias pbcopy='tee > /dev/clipboard'
  alias pbpaste='cat /dev/clipboard'
else
  alias o='xdg-open'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  elif (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias rmi='rm -i'
alias cask="brew cask"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -t -e vim -b viminfo'
