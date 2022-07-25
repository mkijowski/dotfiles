#!/bin/bash

RUNNING="`/usr/bin/ps -aux | grep 'openboard$' | grep -v 'bwrap' | grep -v 'grep'`"

if [[ -n $RUNNING ]]; then
    PID="`echo $RUNNING | awk '{print $2}'`"
    kill $PID
else
    flatpak run ch.openboard.OpenBoard & disown
fi

