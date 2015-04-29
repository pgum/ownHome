#!/bin/bash
source ~/.bashrc -silent
sourceBashrc ui.framework

echo "Bashrc plug-in list:"

for f in ~/ownHome/Bashrc/[0-9]*
do
  fname=$(basename $f)
  [ -f ~/.Bashrc/$fname ] && echoOk "[ON ][Std]${stop_color} $fname" || echoError "[OFF][Std]${stop_color} $fname"
done

for f in ~/.Bashrc/[0-9]*
do
  fname=$(basename $f)
  [ "$(readlink $f)" = "$HOME/ownHome/Bashrc/$fname" ] || echoWarn "[ON ][---]${stop_color} $fname"
done


