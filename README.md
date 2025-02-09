# ansible_hashicorp-consul
Ansible to Install [Hashicorp Consul](https://www.consul.io/) on Ubuntu

## Requirements

* Tailscale installed and configured for ssh
    ```bash
    sudo tailscale up --hostname "$(hostname -f | awk -F"." '{print $3}')-$(hostname -f | awk -F"." '{print $2}')-$(hostname)" --ssh --advertise-tags "tag:servers,tag:cloud-$(hostname -f | awk -F"." '{print $3}')-region-$(hostname -f | awk -F"." '{print $2}'),tag:hashiconsul"
    ```

## Run

```bash
ansible-playbook -i hosts site.yaml -v --diff
```