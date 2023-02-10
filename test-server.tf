## Create a server
resource "hcloud_server" "terraform-testing" {
  name        = "terraform-testing.com"
  image       = "debian-11"
  server_type = "${var.tiny}"
  backups     = "false"
  placement_group_id = hcloud_placement_group.infra.id
  datacenter  = "fsn1-dc1"
  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  firewall_ids = [hcloud_firewall.terraform-testing-fw.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }
  labels = {
    "tag" : "terraform-testing"
  }
  depends_on = [
    hcloud_network_subnet.subnet01
  ]
}

## Networking
resource "hcloud_network" "net01" {
  name     = "net01"
  ip_range = "10.0.0.0/8"
  labels = {
    "tag" : "terraform-testing"
  }
}
resource "hcloud_network_subnet" "subnet01" {
  network_id   = hcloud_network.net01.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}
# Network attachment
resource "hcloud_server_network" "srvnetwork" {
  server_id  = hcloud_server.terraform-testing.id
  network_id = hcloud_network.net01.id
  ip         = "10.0.1.5"
}

## Firewall
resource "hcloud_firewall" "terraform-testing-fw" {
  name = "terraform-testing-fw"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      #"165.22.32.53/32",
      "79.130.18.58/32"
    ]
  }
  labels = {
    "tag" : "terraform-testing"
  }
}

## Uncomment to create Volume 
/* resource "hcloud_volume" "storage" {
  name       = "test-volume"
  size       = 10
  server_id  = "${hcloud_server.terraform-testing.id}"
  automount  = true
  format     = "ext4"
  labels = {
    "tag" : "terraform-testing"
  }
} */

## Placement Group
resource "hcloud_placement_group" "infra" {
  name = "infra"
  type = "spread"
  labels = {
    tag = "infra"
    tag = "created in Terraform"
  }
}