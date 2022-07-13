#!/bin/bash

commandsDir=~/scripts/processes.txt

#Creates folders that are supposed to be there if they aren't
dirs=("sync" "memez" "compSciProjects" "wallpapers")

for dir in "${dirs[@]}"; do
	    [ ! -d ~/$dir ] && mkdir ~/$dir
    done

: 'Runs a bunch of background processes
- disowns each process so it can move to the background and the next process can move to the foreground 
- wc command does not count last line for some reason, does not count the first line as 0 either so...
'
i=1
numLines=$(wc -l <$commandsDir) #number of lines present in file
((numLines++))

while [ $i -le $numLines ]; do
    echo "$(head -$i $commandsDir | tail +$i)"" & disown" | bash
    echo "Line $i's command worked"
    ((i++))
done

: 'Runs a bunch of commands after pausing for a bit
-
'
sleep 1
redshift -O 7500K
rclone sync ~/scripts/ onedrive:scripts/
