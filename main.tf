terraform {
  required_providers {
    hcloud={
      source = "hetznercloud/hcloud"
    }
  }
  required_version = ">=0.13"
}

variable "hcloud_token" {}

provider "hcloud" {
  token = var.hcloud_token
}

variable "server_count" {
  default = 7
}

resource "hcloud_server" "sephorum" {
  count = var.server_count
  name        = "sq${count.index + 1}"
  image       = "ubuntu-24.04"
  server_type = "cpx41"
  location    = "hel1"
}

labels = {
  environment = "qa"
  app         = "sephorum"
}

ssh_keys = [
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPlvyCBfJT4BEr1/SwJBcveH67LMWJZQA+H+xM7b2+2/"
]
