terraform {
  cloud {
    organization = "Testing_providers"

    workspaces {
      name = "hetzner"
    }
  }
}
