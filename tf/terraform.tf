terraform {
  cloud {
    organization = "MasterBaiters"
    workspaces {
      name = "devops-discord"
    }
  }

  required_version = "1.9.0"

  required_providers {
    discord = {
      source  = "Midwest-Master-Baiters/discord"
      version = "2.0.0"
    }
  }
}