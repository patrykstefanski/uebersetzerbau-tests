#!/bin/bash

compiler="$1"
input="$2"
expected=${input##*.}
exec_="output/$(basename $input)"
asm="${exec_}.s"

${compiler} < $input > $asm
gcc -g $asm test.c -o $exec_
$exec_
res=$?

  if [ "$res" == "$expected" ]
  then
    echo "passed: ${input}, matched $res"
  else
    echo "failed: ${input}, should be $expected, was $res"
  fi
