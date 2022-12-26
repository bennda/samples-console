#!/bin/bash

[ $? -eq 0 ] || {
    echo "Incorrect option provided"
    exit 1
}

MODE="echo"
TEXT=""
RANDOM_MIN=0
RANDOM_MIN=1000

# transform long options to short ones
for arg in "$@"; do
    shift
    case "$arg" in
    '-mode') set -- "$@" '-m' ;;
    '-text') set -- "$@" '-t' ;;
    '-randmin') set -- "$@" '-s' ;;
    '-randmax') set -- "$@" '-e' ;;
    *) set -- "$@" "$arg" ;;
    esac
done

while getopts m:t:s:e: flag; do
    case "${flag}" in
    m) MODE=${OPTARG} ;;
    t) TEXT=${OPTARG} ;;
    s) RANDOM_MIN=${OPTARG} ;;
    e) RANDOM_MAX=${OPTARG} ;;
    esac
done

if [ $MODE == "echo" ]; then
    echo "$TEXT"
    exit 0
fi

if [ $MODE == "random" ]; then
    RAND=$RANDOM_MAX-$RANDOM_MIN
    echo $(($RANDOM % $RAND))
    exit 0
fi