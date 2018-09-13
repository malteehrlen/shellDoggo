#!/bin/bash
#gets ur back
#USAGE: doggo.sh name tty
if [ -z "$STY" ]; then exec screen -dm -S dogscreen /bin/bash "$0" "$1" "$2"; fi

w > initial_state
oline=$(wc -l < initial_state)

while :
do
sleep 5
w > current_state
cline=$(wc -l < current_state)
if [ "$oline" -ne "$cline" ]; then
        echo another user logged on | write $1 $2

fi
done
