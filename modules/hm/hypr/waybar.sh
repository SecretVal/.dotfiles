#!/usr/bin/env sh
while :
do
    if [ "$(hyprctl activeworkspace -j | jq .windows)" = 0 ]
    then
        systemctl --user stop --now waybar.service
    else
        systemctl --user start --now waybar.service
    fi
done
