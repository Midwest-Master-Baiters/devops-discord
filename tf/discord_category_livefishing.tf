########################################################################################################################
# Category
########################################################################################################################
resource "discord_category_channel" "live_fishing" {
  name     = "Live Fishin' 📺"
  position = 3

  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.community]
}


########################################################################################################################
# Channels
########################################################################################################################
resource "discord_text_channel" "live_fishing_shore_text" {
  count    = 2
  name     = "shore-${count.index + 1}"
  position = max(range(1, (2 * count.index))...)

  server_id  = discord_server.production.id
  category   = discord_category_channel.live_fishing.id
  depends_on = [discord_server.production, discord_category_channel.live_fishing]
}

resource "discord_voice_channel" "live_fishing_shore_voice" {
  count    = length(discord_text_channel.live_fishing_shore_text)
  name     = "Shore ${count.index + 1}"
  position = discord_text_channel.live_fishing_shore_text[count.index].position + 1

  server_id  = discord_server.production.id
  category   = discord_category_channel.live_fishing.id
  depends_on = [discord_server.production, discord_category_channel.live_fishing]
}


########################################################################################################################
# Permissions
########################################################################################################################
