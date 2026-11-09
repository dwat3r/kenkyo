#!/bin/bash
set -euo pipefail

DAEMON=dev.kanata.kanata
AGENT=dev.kanata.vk-agent
DAEMON_PLIST=/Library/LaunchDaemons/$DAEMON.plist
AGENT_PLIST=$HOME/Library/LaunchAgents/$AGENT.plist

sudo launchctl bootout system/$DAEMON 2>/dev/null || true
launchctl bootout "gui/$(id -u)/$AGENT" 2>/dev/null || true

sudo rm -rf /etc/kanata
sudo mkdir -p /etc/kanata
sudo cp -R ../sofle.kbd ../qwerty-macbook.kbd ../common /etc/kanata/
sudo cp kanata.newsyslog.conf /etc/newsyslog.d/kanata.conf
sudo cp $DAEMON.plist $DAEMON_PLIST
sudo chown root:wheel $DAEMON_PLIST
sudo launchctl bootstrap system $DAEMON_PLIST

mkdir -p "$HOME/Library/LaunchAgents"
cp $AGENT.plist "$AGENT_PLIST"
launchctl bootstrap "gui/$(id -u)" "$AGENT_PLIST"
