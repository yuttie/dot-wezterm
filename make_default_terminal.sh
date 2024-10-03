#!/bin/sh
gsettings set org.gnome.desktop.default-applications.terminal exec 'wezterm start --always-new-process --cwd .'
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'wezterm start --always-new-process --cwd .'
