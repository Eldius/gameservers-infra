# A Test Project for my Gamerservers Ansible Roles #

## Price sheet (used by me to test) ##

| Game      | provider     | region | instance type | memory | price/month | description                                    |
|-----------|--------------|--------|---------------|--------|-------------|------------------------------------------------|
| Minecraft | DigitalOcean | NYC3   | s-1vcpu-2gb   | 2GB    | USD10       | RAM: 2GB/1 vCPU/SSD Size: 50 GB/Transfer: 2 TB |

## Code Snippets ##

    # SSH to a server (not tested when we have more than one instance)
    $ ssh root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")
