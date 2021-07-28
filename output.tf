output "ssh_commands" {
    value = format("ssh root@%s", hcloud_server.webserver.ipv4_address)
}
