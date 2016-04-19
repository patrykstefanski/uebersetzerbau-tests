#!/bin/bash
for file in *.[0-2]
do
  if [ -f "$1" ]
  then
    parser="$1"
  else
    parser="../../../parser/parser"
  fi
  $parser < ${file} &> /dev/null
  res=$?
  expected=${file##*.}
  if [ "$res" == "$expected" ]
  then
    echo "passed: ${file}, matched $res"
  else
    echo "failed: ${file}, should be $expected, was $res"
  fi
done
