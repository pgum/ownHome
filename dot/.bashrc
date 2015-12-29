#if global config exist, include that first
[ -f /etc/bashrc ] &&  source /etc/bashrc

alias tarit='tar -cvf '
alias untarit='tar -xf '

alias clc="clear && printf '\033[3J'"
alias h='history | grep $1'

alias ls='ls -A --color=always'
alias ll='ls -l'

alias mv='mv -v -i'
alias cp='cp -v -i'
alias rm='rm -v -i'
alias rmrf='rm -r -v -f'
work=/var/work
alias basr=". ~/.bashrc"

fgp(){
  find . -name \*$2 -exec grep -l "$1" {} \;
}

unset HISTFILE          #Privacy issues and it was mentioned that logging makes slow the logout.
export PATH=./:$PATH
export GREP_OPTIONS='--color=auto'
loadedAddonConfigs=""
loadAdditionalBashrcToConfig(){
  shopt -s extglob  
  for additionalBashrc in ~/.bashrc.d/[0-9]*
    do
    configFilename=$(basename ${additionalBashrc})
    loadedAddonConfigs="${loadedAddonConfigs} ${configFilename#*.}"
    source $additionalBashrc
  done
  export loadedAddonConfigs=$loadedAddonConfigs
}

listAddons(){
  echo "Loaded addons:$loadedAddonConfigs"
}
isSymlinkValid(){
   cat $(readlink $1) &>> /dev/null
}
checkExistingSymlinksToAddonConfigs(){
   for additionalBashrc in ~/.bashrc.d/[0-9]*
     do
    isSymlinkValid $additionalBashrc || unlink $additionalBashrc
  done
}

#checkExistingSymlinksToAddonConfigs
loadAdditionalBashrcToConfig
