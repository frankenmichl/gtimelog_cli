#!/usr/bin/env bash

TASKFILE=~/.local/share/gtimelog/tasks.txt
TIMELOGFILE=~/.local/share/gtimelog/timelog.txt

function do_log {
    NOW=$(date +"%Y-%m-%d %H:%M")
    if [ "$1" == "arrived" ]; then
	echo ""
    fi
    echo "$NOW: $*" >> $TIMELOGFILE
}


if [ $# == 0  ]; then
    nl $TASKFILE
    read -p "select item :" LINE

    LOGLINE="`head -${LINE} ${TASKFILE} | tail -1`"
    do_log "$LOGLINE"
else
    if [ $1 == "rauchen" ]; then
	do_log "$* **"
    elif [ $1 == "mittag" ]; then
	do_log "$* **"
    else
	do_log "$*"
    fi
fi
