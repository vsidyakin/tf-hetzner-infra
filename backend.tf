terraform {
  cloud {
    organization = "Hetzner-GMBH-infra"

    workspaces {
      name = "infra"
    }
  }
}