scrot -q 100 'scrot_2D_%Y-%m-%d_%H-%M-%S_$wx$h.png' -e 'mv $f ~/Pictures/scrot/' && dunstify -u low 'SCREENSHOT' 'Full screenshot'
