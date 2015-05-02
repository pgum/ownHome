#if global config exist, include that first
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi

alias tarit='tar -cvf '
alias untarit='tar -xf '

alias h='history | grep $1'

alias ls='ls -A --color=always'
alias ll='ls -l'
shopt -s autocd

alias mv='mv -v -i'
alias cp='cp -v -i'
alias rm='rm -v -i'
alias rmrf='rm -r -v -f'

fgp(){
  find . -name \*$2 -exec grep -l "$1" {} \;
}

unset HISTFILE          #Privacy issues and it was mentioned that logging makes slow the logout.
export PATH=./:$PATH
export GREP_OPTIONS='--color=auto'

loadAdditionalBashrcToConfig(){
  local loadedAddonConfigs=""
  for additionalBashrc in ~/.bashrc.d/[0-9]*
    do
    configFilename=$(basename ${additionalBashrc})
    loadedAddonConfigs="${loadedAddonConfigs} ${configFilename#*.}"
    source $additionalBashrc
  done
  local splash=${1:-"-verbose"}
  [ ! $splash = "-silent" ] && echo "Loaded config:$loadedAddonConfigs"
}
loadAdditionalBashrcToConfig ${1:-""}
