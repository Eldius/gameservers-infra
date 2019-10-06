#!/bin/bash

BACKUPS_FOLDER_LOCAL="../../../.backups/${PWD##*/}"
BACKUPS_FOLDER_REMOTE="backups"

mkdir -p ${BACKUPS_FOLDER_LOCAL}

ssh \
    -o "UserKnownHostsFile=/dev/null" \
    -o "StrictHostKeyChecking=no" \
    root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") <<ENDSSH

    mkdir -p ${BACKUPS_FOLDER_REMOTE}
    TIME_TAG=\$( date "+%Y-%m-%d.%H:%M:%S" )
    systemctl stop minecraft.service
    cd /servers
    tar -cvzf ${BACKUPS_FOLDER_REMOTE}/minecraft-\${TIME_TAG}.tar.bz2 minecraft

ENDSSH

sftp \
    -o "UserKnownHostsFile=/dev/null" \
    -o "StrictHostKeyChecking=no" \
    root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") <<ENDSFTP

    get -r ${BACKUPS_FOLDER_REMOTE} ${BACKUPS_FOLDER_LOCAL}
ENDSFTP

ssh \
    -o "UserKnownHostsFile=/dev/null" \
    -o "StrictHostKeyChecking=no" \
    root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") <<ENDSSH

    systemctl start minecraft.service
    rm -rf ${BACKUPS_FOLDER_REMOTE}

ENDSSH

notify-send --urgency=low "hey you!" "take a look..."
