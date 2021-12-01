eval $(/usr/bin/gnome-settings-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_INFO SSH_AUTH_SOCK
