#!/bin/bash

codegen="../../../codea/codea"
if [ -f "$1" ]
then
  codegen="$1"
fi

testFolder="../codea"
if [ -f "$2" ]
then
  testFolder="$2"
fi

for input in ${testFolder}/*.[0-3]
do
  expected=${input##*.}
  exec_="output/$(basename $input)"
  asm="${exec_}.s"

  ${codegen} < $input > $asm
  res=$?
  if [ "$res" != "$expected" ]
  then
    echo "failed: ${input}, should be $expected, was $res"
    exit $res
  fi

  if [ "$res" != "0" ]
  then
    echo "passed : Failed correctly!"
    continue
  fi

  CALLFILE="${input%.*}.call"
  if [ ! -f "$CALLFILE" ] 
  then
    echo "Call file for test ${input} missing!"
    continue
  fi

  gcc -g $asm -DCALL=\"$CALLFILE\" test.c -o $exec_
  if [ "$?" != "0" ]
  then
    echo "Failed to compile"
    continue
  fi

  $exec_
  res=$?
  if [ "$res" == "0" ]
  then
    echo "passed: ${input} produced corret result"
  else
    echo "failed: ${input}, wrong result"
  fi
done
