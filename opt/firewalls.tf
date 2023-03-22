## Firewalls. Create firewall here if you need more than one
/* resource "hcloud_firewall" "terraform-testing-fw" {
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
} */
