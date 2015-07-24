#!/bin/bash

#if no argument given exit with message
[ -z $1 ] && echo -n "usage: $0 <" && for dir in $(find $(dirname $0)/../dot -name *.d); do echo -n " $(basename $dir)"; done && echo ">"&& exit

#rename files prepending them with rising number follwed by dot sign
index=10
step=10
for f in $(dirname $0)/../dot/$1/*
  do
    mv $f $i.${f#*.}
    let index=index+step
  done

