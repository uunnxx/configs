scrot -m -u -b -q 100 'focused_window_%Y-%m-%d_%H-%M-%S_$wx$h.png' -e 'mv $f ~/Pictures/scrot/focused/' && dunstify -u low 'SCREENSHOT' 'Focused window'
