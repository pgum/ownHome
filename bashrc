echo "$0 WGRANY!"
alias ll='ls -Al --color=always'
alias ls='ls -A --color=always'
alias ..='cd ..'
hdd='/i-data/md0'
alias basr='. /ffp/home/root/.bashrc'
export PS1="\[\e[1;32m\]\h\[\e[1;32m\]:\[\e[1;34m\]\w \[\e[0m\]\\$ "                              # TODO: k0p: remove this and/or force TERM=xterm ? ping dag-                                      case "$TERM" in                                                                                   linux|nxterm|screen|xterm|xterm-color)                                                              ;;                                                                                              "")                                                                                                 export TERM="linux"                                                                               ;;                                                                                              *)                                                                                                  export TERM="xterm"                                                                               ;;                                                                                              esac                                                                       

