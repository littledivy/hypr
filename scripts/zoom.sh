hyprctl keyword misc:cursor_zoom_factor "$(hyprctl getoption misc:cursor_zoom_factor | grep float | awk '{print  $2*   1.1}')"

