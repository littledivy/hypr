#!/bin/bash
music_icon="$HOME/.config/swaync/icons/music.png"

show_music_notification() {
    status=$(playerctl status)
    if [[ "$status" == "Playing" ]]; then
        song_title=$(playerctl metadata title)
        song_artist=$(playerctl metadata artist)
        notify-send -e -u low -i "$music_icon" "Now Playing:" "$song_title\nby $song_artist"
    elif [[ "$status" == "Paused" ]]; then
        notify-send -e -u low -i "$music_icon" "Playback Paused"
    fi
}

case "$1" in
    "--nxt")
        playerctl next
        show_music_notification
        ;;
    "--prv")
        playerctl previous
        show_music_notification
        ;;
    "--pause")
        playerctl play-pause
        show_music_notification
        ;;
    "--stop")
        playerctl stop
        notify-send -e -u low -i "$music_icon" "Playback Stopped"
        ;;
    *)
        echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
        exit 1
        ;;
esac
