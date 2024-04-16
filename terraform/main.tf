locals {
  key_path = "~/.ssh/tf_hetzner"
  location = "hil" # Virginia
}

resource "hcloud_ssh_key" "default" {
  name       = "default"
  public_key = file("${local.key_path}.pub")
}

resource "hcloud_server" "app" {
  name                     = "your-app-name"
  image                    = "ubuntu-22.04"
  server_type              = "cpx11"
  location                 = local.location
  ssh_keys                 = [hcloud_ssh_key.default.id]
  shutdown_before_deletion = true
  backups                  = true

  labels = {
    managed_by = "terraform"
    // Add any other labels here
  }
}

resource "hcloud_floating_ip" "app" {
  type          = "ipv4"
  home_location = local.location
}

resource "hcloud_floating_ip_assignment" "main" {
  floating_ip_id = hcloud_floating_ip.app.id
  server_id      = hcloud_server.app.id
}
