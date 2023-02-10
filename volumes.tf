/* ## Uncomment to create Volume 
resource "hcloud_volume" "test-volume" {
  name       = "test-volume"
  size       = 10
  server_id  = "${hcloud_server.terraform-testing.id}"
  automount  = true
  format     = "ext4"
  labels = {
    "tag" : "terraform-testing"
  }
} */