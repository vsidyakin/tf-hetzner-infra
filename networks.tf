/* ## Networks. Create networks here if you need to create more than one
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
} */
