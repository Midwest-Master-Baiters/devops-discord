########################################################################################################################
# Category
########################################################################################################################
resource "discord_category_channel" "information" {
  name       = "Information"
  position   = 0
  server_id  = discord_server.production.id
  depends_on = [discord_server.production]
}


########################################################################################################################
# Channels
########################################################################################################################
resource "discord_text_channel" "information_welcome" {
  name     = "welcome-and-rules"
  position = 0

  server_id  = discord_server.production.id
  category   = discord_category_channel.information.id
  depends_on = [discord_server.production, discord_category_channel.information]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_news_channel" "information_announcements" {
  name     = "announcements"
  position = 1

  server_id  = discord_server.production.id
  category   = discord_category_channel.information.id
  depends_on = [discord_server.production, discord_category_channel.information]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_text_channel" "information_creators" {
  name     = "content-creators"
  position = 2

  server_id  = discord_server.production.id
  category   = discord_category_channel.information.id
  depends_on = [discord_server.production, discord_category_channel.information]
  lifecycle { ignore_changes = [topic] }
}


########################################################################################################################
# Permissions
########################################################################################################################
