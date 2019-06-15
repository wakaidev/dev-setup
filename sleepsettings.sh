#!/usr/bin/env bash

# ~/sleepsettings.sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Capabilities for AC Power:
#  displaysleep
sudo pmset -a displaysleep 2
#  disksleep
sudo pmset -a disksleep 3
#  sleep
sudo pmset -a sleep 4
#  womp
sudo pmset -c womp 1
#  acwake
sudo pmset -a acwake 0
#  lidwake
sudo pmset -a lidwake 1
#  halfdim
#  sms
sudo pmset -a sms 0
#  standby
sudo pmset -a standby 1
#  standbydelay
sudo pmset -a standbydelay 5
#  ttyskeepawake
sudo pmset -a ttyskeepawake 0
#  hibernatemode
sudo pmset -a hibernatemode 25
#  hibernatefile
sudo pmset -a hibernatefile /hibernation/sleepimage
#
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
    "Dock" "Finder" "Mail" "Messages" \
    "Safari" "SystemUIServer" \
    "iCal"; do
    killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart of your OS to take effect.
