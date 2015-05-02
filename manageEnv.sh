#!/bin/bash
source ~/.bashrc -silent
scriptPath=$(dirname "$(readlink -f "$0")")
listPluginsInFolder(){
  [ -z $1 ] && return
  #Primary plugin list - mandatory
  echo "Plug-in list for $1"
  for f in $scriptPath/$1/[0-9]*
    do
    fname=$(basename $f)
    [[ -f ~/.$1/$fname ]] && echoOk "[ON ]${stop_color} $fname" || echoError "[OFF]${stop_color} $fname"
  done

#Custom plugin list - optional
  customPlugins=""
  for f in ~/.$1/[0-9]*
    do
    fname=$(basename $f)
    [[ ! "$(readlink $f)" =~ "$scriptPath" ]] && customPlugins="$customPlugins $fname" #
  done

  [ "$customPlugins" != "" ] && echo "Custom plug-ins for $1" && echoInfo "[ON ]${stop_color} $fname"

  echo
}

listPluginsInFolder bashrc.d
listPluginsInFolder vimrc.d

