terraform {
  required_providers {
    illumio-core = {
      source  = "illumio/illumio-core"
    }
  }
}

provider "illumio-core" {
  pce_host     = var.pce_url
  api_username = var.pce_api_key
  api_secret   = var.pce_api_secret
  org_id       = var.pce_org_id
}
