# Ansible

[Ansible](https://www.ansible.com/) playbooks to automatically optimize and secure your servers for Ubuntu only.

These playbooks were heavily inspired by https://github.com/guillaumebriday/kamal-ansible-manager.

# WARNING!

These playbooks make no security guarantees. DYOR. I feel they are "secure enough" for my side projects.

## Usage

See the [Makefile](./Makefile).

You'll need to create Hetzner servers with terraform to get your primary ip. Then change the ip in the Makefile.

Essentially, run this once:

```shell
make provision
```

Then to deploy your app:

```shell
make deploy
```

The deploy tasks are currently for a Go app which is cross-compiled locally.

## TODO
- Automatic security patches and/or other OS updates
- Litestream for realtime sqlite backups (Hetzner takes a snapshot every day)

## What's inside?

It will automatically update your packages and configure these packages to secure your server(s):

- [Fail2ban](https://github.com/fail2ban/fail2ban)
- [UFW](https://wiki.ubuntu.com/UncomplicatedFirewall)
- [NTP](https://ubuntu.com/server/docs/network-ntp)

The playbook also:
- Remove [Snap](https://snapcraft.io/).
- Disable ssh password login.

