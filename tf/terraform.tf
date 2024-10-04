terraform {
  cloud {
    organization = "MasterBaiters"
    workspaces {
      name = "devops-discord"
    }
  }

  required_providers {
    discord = {
      source  = "Midwest-Master-Baiters/discord"
      version = "2.1.0"
    }
  }
}