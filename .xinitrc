~/.fehbg &
dunst &
picom &
dwmblocks &

# -R restores the last colorscheme that was in use.
wal -R -o ~/.reload_dunst.sh &

while true; do
	dwm || exit
done
