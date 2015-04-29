#!/bin/bash
source ~/.bashrc -silent
sourceBashrc ui.framework

listPluginsInFolder(){
[ -z $1 ] && return
echoInfo "Plug-in list for $1"
for f in ~/ownHome/$1/[0-9]*
do
  fname=$(basename $f)
  [ -f ~/.$1/$fname ] && echoOk "[ON ][Std]${stop_color} $fname" || echoError "[OFF][Std]${stop_color} $fname"
done

for f in ~/.$1/[0-9]*
do
  fname=$(basename $f)
  [ "$(readlink $f)" = "$HOME/ownHome/$1/$fname" ] || echoWarn "[ON ][---]${stop_color} $fname"
done
echo
}

listPluginsInFolder Bashrc

listPluginsInFolder Vimrc
