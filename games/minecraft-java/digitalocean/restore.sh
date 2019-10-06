#!/bin/bash

BACKUPS_FOLDER_LOCAL="../../../.backups/${PWD##*/}"
BACKUPS_FOLDER_REMOTE="backups"

mkdir -p ${BACKUPS_FOLDER_LOCAL}

FILE=$(dialog --stdout --title "Please choose a file" --fselect $BACKUPS_FOLDER_LOCAL/ 14 48)

printf "FILE: ${FILE}"

sftp \
    -o "UserKnownHostsFile=/dev/null" \
    -o "StrictHostKeyChecking=no" \
    root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") <<ENDSFTP

    put ${FILE} /servers
ENDSFTP

ssh \
    -o "UserKnownHostsFile=/dev/null" \
    -o "StrictHostKeyChecking=no" \
    root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") <<ENDSSH

    TIME_TAG=\$( date "+%Y-%m-%d.%H:%M:%S" )
    systemctl stop minecraft.service
    mv minecraft-old-${TIME_TAG}
    tar -xvzf minecraft-*.tar.bz2 -C /servers
    systemctl start minecraft.service
    rm minecraft-*.tar.bz2

ENDSSH

notify-send --urgency=low "hey you!" "take a look..."
