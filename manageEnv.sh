#!/bin/bash
source ~/.bashrc -silent
sourceBashrc ui.framework

for f in ownHome/Bashrc/[0-9]*
do
  fname=$(basename $f)
  [ -f ~/.Bashrc/$fname ] && echoOk "[ON ][Std] $fname" || echoError "[OFF][Std] $fname"
done

for f in ~/.Bashrc/[0-9]*
do
  fname=$(basename $f)
  [ "$(readlink $f)" = "$HOME/ownHome/Bashrc/$fname" ] || echoWarn "[ON ][---]$fname"
done

