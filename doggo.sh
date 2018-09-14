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
if [ "$oline" -lt "$cline" ]; then
        echo another user logged on | write $1 $2
        rm initial_state current_state #you can add doggo here to commit suicide
        break
elif [ "$oline" -gt "$cline" ]; then
        oline=$cline
        echo another user logged off | write $1 $2
fi
if [ "$cline" -eq 2 ]; then
        #it seems im alone
        rm initial_state current_state #you can add doggo here to commit suicide
        break
fi
done
