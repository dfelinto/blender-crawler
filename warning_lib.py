#!/bin/bash

BLENDER=$HOME/src/blender/versions/blender-2.78a/blender

result=$($BLENDER -b $1 | grep "Warning: LIB")

if [[ -z $result ]]; then
    exit 0
else
    exit 1
fi

