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
  token = var.hcloud_token  ## this is to talk to the cloud providers using the api generated on hetzener
}

variable "server_count" {
  default = 7                   ## here it procures 7 servers
}

resource "hcloud_server" "sephorum" {
  count = var.server_count
  name        = "sq${count.index + 1}"
  image       = "ubuntu-24.04"
  server_type = "cpx41"
  location    = "hel1"
}

labels = {
  environment = "qa/prod/staging"
  app         = ""  ## add the app name
}

ssh_keys = [
  ""  ## add ur ssh keys to the servers
]
