#!/bin/sh

# SSH login without password
# http://www.linuxproblem.org/art_9.html

SOURCEDIR="$(dirname $0)/../../abgabe"
HOST="g0.complang.tuwien.ac.at"

usage() {
    cmd="$0 (asma | asmb | scanner | parser | ag | codea | codeb | gesamt) [sourcedir]"
    echo "Usage:"
    echo
    echo "export UBLOGIN=u1234567"
    echo $cmd
    echo
    echo "or"
    echo
    echo "UBLOGIN=u1234567 $cmd"
    exit 1
}

if [[ ! " asma asmb scanner parser ag codea codeb gesamt " =~ " $1 " ]]; then
    usage
fi

if [[ -z $UBLOGIN ]]; then
    usage
fi

if [[ -n "$2" ]]; then
    SOURCEDIR=$2
fi

# Copy sources.
rsync --progress --recursive $SOURCEDIR/$1 $UBLOGIN@$HOST:abgabe

# Copy tests.
rsync --progress --recursive $(dirname $0)/../$1 $UBLOGIN@$HOST:test

# Run tests.
ssh $UBLOGIN@$HOST "/usr/ftp/pub/ubvl/test/$1/test"
