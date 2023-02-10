# Obtain ssh key data
/* data "hcloud_ssh_key" "ssh_key" {
  name = "ssh_key"
} */
data "hcloud_ssh_keys" "all_keys" {
}
data "hcloud_ssh_keys" "keys_by_selector" {
  with_selector = "ssh_keys"
}

## Server types
variable "tiny" {
  default = "cx11"
}
variable "standard" {
  default = "cpx11"
}
variable "moAdvanced" {
  default = "cpx31"
}
variable "moPro" {
  default = "cpx41"
}