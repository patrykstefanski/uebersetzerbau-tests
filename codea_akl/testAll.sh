#!/bin/bash
for file in cases/*
do
  if [ -f "$1" ]
  then
    codegen="$1"
  else
    codegen="../../../codea/codea"
  fi
  ./test.sh ${codegen} ${file} 2>/dev/null
done
