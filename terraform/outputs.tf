output "primary_ip" {
  value = hcloud_server.app.ipv4_address
}

output "floating_ip" {
  value = hcloud_floating_ip.app.ip_address
}
