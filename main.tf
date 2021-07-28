terraform {
    required_version = ">= 1.0.0"
    required_providers {
        hcloud = {
            source  = "hetznercloud/hcloud"
            version = "~> 1.26.0"
        }
    }
}

provider "hcloud" {
    token = var.hcloud_token
}

resource "hcloud_ssh_key" "ssh_key" {
    name       = "ssh-key"
    public_key = file(var.ssh_public_key_file)
}

resource "hcloud_server" "webserver" {
    name        = "webserver"
    image       = "ubuntu-20.04"
    server_type = "cx11"
    firewall_ids = [hcloud_firewall.firewall.id]

    ssh_keys = [
        hcloud_ssh_key.ssh_key.id,
    ]

    user_data = file("startscript.sh")
}

resource "hcloud_firewall" "firewall" {
    name = "firewall"
    rule {
        direction = "in"
        protocol  = "tcp"
        port = "80"
        source_ips = [
            "0.0.0.0/0",
            "::/0"
        ]
    }
    rule {
        direction = "in"
        protocol  = "tcp"
        port = "443"
        source_ips = [
            "0.0.0.0/0",
            "::/0"
        ]
    }
    rule {
        direction = "in"
        protocol = "tcp"
        port = "22"
        source_ips = [
            "0.0.0.0/0",
            "::/0"
        ]
    }
}

resource "hcloud_volume" "volume" {
    name      = "chinapolis-volume"
    size      = 30
    server_id = hcloud_server.webserver.id
    automount = true
    format    = "ext4"
}


