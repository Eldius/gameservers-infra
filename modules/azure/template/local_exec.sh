#!/bin/bash

sleep 30 && \
    cd ../../../ansible && \
    ansible-galaxy install \
        -r roles/requirements.yml \
        --roles-path=roles/ -f && \
    ansible-playbook \
        -u ${user_name} \
        -i '${hosts_ips},' \
        --private-key ~/.ssh/id_rsa ${playbook}
