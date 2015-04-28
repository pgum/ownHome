#!/bin/bash
shopt -s extglob

i=10
for f in !($(basename $0))
  do
    mv $f $i.${f#*.}
    let i=i+10
  done


