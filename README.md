# A Test Project for my Gamerservers Ansible Roles #

## Price sheet (used by me to test) ##

| Game      | provider     | region | instance type | memory | price/month| Average Ping | description                                    |
|-----------|--------------|--------|---------------|--------|------------|--------------|------------------------------------------------|
| Minecraft | DigitalOcean | NYC3   | s-1vcpu-2gb   | 2GB    | USD10      | 120ms        | RAM: 2GB/1 vCPU/SSD Size: 50 GB/Transfer: 2 TB |

## Code Snippets ##

    # SSH to a server (not tested when we have more than one instance)
    $ ssh root@$(terraform output | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")

## References ##

- [matti/terraform-google-compute-instance](https://github.com/matti/terraform-google-compute-instance)
- [terraform-google-compute-instance](https://registry.terraform.io/modules/matti/compute-instance/google/0.1.0)
- [Google Cloud Platform Provider](https://www.terraform.io/docs/providers/google/index.html)
- [google_compute_instance](https://www.terraform.io/docs/providers/google/r/compute_instance.html)
- [Getting Started with the Google Provider](https://www.terraform.io/docs/providers/google/getting_started.html)