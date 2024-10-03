########################################################################################################################
# Category
########################################################################################################################
resource "discord_category_channel" "administration" {
  name     = "Administration ⛔"
  position = 6

  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.live_fishing]
}


########################################################################################################################
# Channels
########################################################################################################################
resource "discord_text_channel" "administration_branding" {
  name     = "branding"
  position = 1

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_text_channel" "administration_void" {
  name     = "factoid-void"
  position = 2

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_text_channel" "administration_tech" {
  name     = "tech-sperg"
  position = 3

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_text_channel" "administration_github" {
  name     = "github"
  position = 4

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_voice_channel" "administration_bants" {
  name     = "Banter"
  position = 5

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}


########################################################################################################################
# Permissions
########################################################################################################################
