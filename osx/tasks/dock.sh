#!/usr/bin/env bash

source ~/.dotfiles/osx/tasks/dock_utils.sh

# WARNING: permanently clears existing dock
clear_dock
disable_recent_apps_from_dock

add_app_to_dock "Vivaldi"
add_app_to_dock "Alacritty"
add_app_to_dock "Notion"
add_app_to_dock "Spotify"
add_folder_to_dock $HOME/Downloads -d 0 -s 2 -v 1

killall Dock
