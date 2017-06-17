#!/usr/bin/bash

# the command you want to executed on right session
cmd="glances"

# take time to desktop on startup
sleep 3

# get current session ID 
sessionId=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId)

# get terminal ID
oldTerminalId=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId $sessionId)

# split to left and right 
newTerminalId=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitSessionLeftRight $sessionId)

# sleep for sure
sleep 1

# run that command in cmd variable in right session
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal $newTerminalId "$cmd"

# clear left session (you can run another command) 
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal $oldTerminalId "clear"
