########################################################################################################################
# Master Baiters
########################################################################################################################
data "discord_permission" "administrators" {
  administrator = "allow"
}

data "discord_color" "administrators" {
  hex = "#FC0FC0"
}

resource "discord_role" "administrators" {
  name  = "Master Baiters"
  color = data.discord_color.administrators.dec

  hoist       = true
  mentionable = false
  position    = 1

  permissions = data.discord_permission.administrators.allow_bits
  server_id   = discord_server.production.id
}