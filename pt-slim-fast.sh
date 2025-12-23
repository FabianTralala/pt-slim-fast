#!/bin/zsh

# This script removes 3rd party integrations and demo material from a fresh Pro Tools install
# and starts the Avid Link Uninstaller.
# To remove all files, it has to run with admin privileges (sudo).
# Use at your own risk.


# check if Pro Tools is running
if [[ -n $(pgrep -x "Pro Tools") ]]; then
    echo "Please quit Pro Tools Application before runninge this script."
    exit 1
fi

# check if SoundFlow is running
if [[ -n $(pgrep -x "SoundFlow") ]]; then
    echo "Please quit SoundFlow Application before runninge this script."
    exit 1
fi


## SKETCH

echo -n "removing sketch... "
rm -rf '/Applications/Pro Tools.app/Contents/PlugIns/System Plug-Ins/Pro Tools Sketch.aaxplugin' && echo "done"


## SPLICE

echo -n "removing splice... "
rm -rf '/Library/Application Support/Avid/Audio/Plug-Ins/Splice.aaxplugin' && \
rm -rf "$HOME/Library/Caches/Splice" && echo "done"


## SOUNDFLOW

echo -n "removing soundflow... "
rm -rf "$HOME/Library/Application Support/SoundFlow" && \
rm -rf "$HOME/Library/Caches/org.soundflow.sfsx" && \
rm -rf "$HOME/.soundflow" && \
rm -rf "/Applications/SoundFlow.app" && \
rm -rf "/usr/local/share/soundflow" && \
rm -rf "/usr/local/share/soundflow" && echo "done"


# DEMO MATERIAL

echo -n "removing demo stuff... "
rm -rf "$HOME/Documents/Pro Tools/Demo Sessions" && \
rm -rf "$HOME/Documents/Pro Tools/Demo Sketches" && echo "done"


# # AVID LINK

echo -n "quitting Avid Link... "
osascript -e 'if application "Avid Link" is running then tell application "Avid Link" to quit' &> /dev/null

# Wait until the app process disappears
while pgrep -x "Avid Link"; do
    sleep 0.5
done \
&& echo "done"

echo -n "starting Avid Link Uninstaller... "
open "/Applications/Avid_Uninstallers/Avid Link/Avid Link Uninstaller.app" \
&& echo "script finished."