## Create a server
resource "hcloud_server" "terraform-testing01" {
  name        = "terraform-testing01.com"
  image       = "debian-11"
  server_type = "${var.tiny}"
  backups     = "false"
  placement_group_id = hcloud_placement_group.infra01.id
  datacenter  = "fsn1-dc14"
  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
  firewall_ids = [hcloud_firewall.terraform-testing-fw.id]
  user_data = file("user_data.yml")
  #user_data = file("docker_install.sh")
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

#resource "hcloud_server" "terraform-testing02" {
#  name        = "terraform-testing02.com"
#  image       = "debian-11"
#  server_type = "${var.tiny}"
#  backups     = "false"
#  placement_group_id = hcloud_placement_group.infra01.id
#  datacenter  = "fsn1-dc14"
#  ssh_keys = data.hcloud_ssh_keys.all_keys.ssh_keys.*.name
#  firewall_ids = [hcloud_firewall.terraform-testing-fw.id]
#  user_data = file("user_data.yml")
#  public_net {
#    ipv4_enabled = true
#    ipv6_enabled = false
#  }
#  labels = {
#    "tag" : "terraform-testing"
#  }
#  depends_on = [
#    hcloud_network_subnet.subnet01
#  ]
#}

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

# Network attachments
resource "hcloud_server_network" "srvnetwork01" {
  server_id  = hcloud_server.terraform-testing01.id
  network_id = hcloud_network.net01.id
  ip         = "10.0.1.5"
}
#resource "hcloud_server_network" "srvnetwork02" {
#  server_id  = hcloud_server.terraform-testing02.id
#  network_id = hcloud_network.net01.id
#  ip         = "10.0.1.6"
#}

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
       "0.0.0.0/32",
      "79.130.18.58/32"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "3306"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "2020"
    source_ips = [
      #"165.22.32.53/32",
      "79.130.18.58/32"
    ]
  }
  labels = {
    "tag" : "terraform-testing"
  }
}

## Placement Group
resource "hcloud_placement_group" "infra01" {
  name = "infra01"
  type = "spread"
  labels = {
    "tag" : "infra01"
  }
}
