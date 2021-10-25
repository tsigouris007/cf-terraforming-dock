terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.3"
    }
  }
}

provider "cloudflare" {
  # Nothing to do here
}
