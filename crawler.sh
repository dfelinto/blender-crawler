#!/bin/bash

# #############################################################################
#
# Blender Crawler
#
# usage:
# ------
# crawler script.py
#
# if no argument, list all .blend files
#
# return .blend files when script returns error
#
###############################################################################

FILES=`find . -name "*.blend" -print`
ERROR="\e[1;31mERROR\e[0m"

if [ $# -eq 0 ]; then

  echo "No arguments passed, just listing the files"
  for i in $FILES; do
    echo $i;
  done

else
  if [[ ! -f $1 ]]; then
    echo -e "[$ERROR]: Script $1 doesn't exist"
    exit
  elif [[ ! -x "$1" ]]; then
    echo -e "[$ERROR]: Script $1 is not executable"
    exit
  fi

  for f in $FILES; do
    # run script for this file
    $1 $f 1 > /dev/null 2 > /dev/null;
    if [[ ! $? -eq 0 ]]; then
      echo $f
    fi
  done
fi

