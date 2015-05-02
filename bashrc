#if global config exist, include that first
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
#<C-s> putty freezer fix
[[ $- == *i* ]] && stty -ixany
[[ $- == *i* ]] && stty ixoff -ixon

fgp()
{
    find . -name \*$2 -exec grep -l "$1" {} \;
}

##PUTTY

alias tarit='tar -cvf '
alias untarit='tar -xf '

alias h='history | grep $1'

alias ls='ls -A --color=always'
alias ll='ls -l'

alias ..='cd ..'
alias mv='mv -v -i'
alias cp='cp -v -i'
alias rm='rm -v -i'
alias rmrf='rm -r -v -f'
shopt -s autocd

# Make sure that there is no logging of the session.
# Privacy issues and it was mentioned that logging makes slow the logout.
unset HISTFILE
export PATH=./:$PATH
export GREP_OPTIONS='--color=auto'

alias dea="deactivate"

loadAdditionalBashrcToConfig(){
  local color_switch="\033["
  local lgreen="${color_switch}1;32m"
  local nocolor="${color_switch}0m"
  local splash=${1:-"-verbose"}
  [ ! $splash = "-silent" ] && echo -ne "${lgreen}Loaded config: ${nocolor}"
  for additionalBashrc in ~/.bashrc.d/[0-9]*
    do
      configFilename=$(basename ${additionalBashrc})
      [ ! $splash = "-silent" ] && echo -n "${configFilename#*.} "
      source $additionalBashrc
    done
  [ ! $splash = "-silent" ] && echo
}
loadAdditionalBashrcToConfig ${1:-""}

sourceBashrc()
{
  local bashrcAddons="~/.bashrc.d"
  [ -f $bashrcAddons/[0-9]*$1 ] && source $bashrcAddons/[0-9]*$1
}
