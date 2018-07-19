[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
xrdb -merge ~/.Xresources
xrdb -merge ~/base16-tomorrow-night-256.Xresources
export GDK_SCALE=2
export GDK_DPI_SCALE=1.125
#export GDK_DPI_SCALE=1.1875

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

export SSH_AUTH_SOCK

# dropbox &
spacefm -d &

urxvtd -q -f -o

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx

$HOME/.local/bin/i3_nvim_focus_server.py &

exec i3
