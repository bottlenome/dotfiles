#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".bashrc" ]] && cat .bashrc >> ${HOME}/.bashrc && continue
  output=${HOME}/$f
  if [ -L $output ]; then
    echo "delete link $output"
    rm $output 
  elif [ -e $output ]; then
    mkdir -p backup
    cp -rf $output backup
    rm -rf $output
  fi
  ln -s ${PWD}/$f $output
done
