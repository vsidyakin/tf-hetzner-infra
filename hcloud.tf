/* ## Create a new SSH key
resource "hcloud_ssh_key" "ssh_key" {
  name       = "ssh_key"
  public_key = file("./keys/vlad.pub")  
} */

# Obtain ssh key data
data "hcloud_ssh_key" "ssh_key" {
  #fingerprint = "d0:73:7e:b3:1d:27:50:b8:80:99:1d:70:e4:46:36:c7"
  name = "ssh_key"
}

# Create a server
resource "hcloud_server" "web" {
  name        = "my-server"
  image       = "debian-11"
  server_type = "cx11"
  datacenter  = "fsn1-dc14"
  ssh_keys  = ["${data.hcloud_ssh_key.ssh_key.id}"]
}

/* # Create a Volume 
resource "hcloud_volume" "storage" {
  name       = "my-volume"
  size       = 10
  server_id  = "${hcloud_server.web.id}"
  automount  = true
  format     = "ext4"
} */