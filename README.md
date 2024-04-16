# No PaaS 4U

You don't need PaaS. Far cheaper to run your app on a [Hetzner](https://www.hetzner.com/cloud/) VM (~$5/mo).

This is a template that you can clone and modify to your needs. It's very much a WIP. YMMV.

There are 2 steps.

1. Modify terraform in `terraform` directory to your use case.
2. Run `terraform apply`
3. Modify ansible Makefile and files to your needs.
4. Run `make provision` once, then `make deploy` as needed.

This assumes 1 web app per server. The VMs are so cheap, I prefer this architecture. It gives you fault tolerance.
(i.e. A memory leak in one app won't consume all your RAM and affect another app.)

If you want a multiple apps on 1 VM, checkout:
- [Caddy](https://caddyserver.com) which is a reverse proxy.
- [Kamal](https://kamal-deploy.org) which deploys reverse proxy to your app in docker containers. (You will need to add the ansible docker and traefik role to provision.yml.)

If you want redundancy (multiple VMs serving the same app), this isn't for you. This example is for indiehacker projects that don't need high redundancy.