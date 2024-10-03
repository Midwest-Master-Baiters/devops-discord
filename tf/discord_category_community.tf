########################################################################################################################
# Category
########################################################################################################################
resource "discord_category_channel" "community" {
  name       = "Community 💬"
  position   = 2
  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.angling]
}


########################################################################################################################
# Channels
########################################################################################################################
resource "discord_text_channel" "community_general" {
  name     = "general"
  position = 0
  nsfw     = false

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_text_channel" "community_gear_chat" {
  name     = "gear-chat"
  position = 1
  nsfw     = false

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_text_channel" "community_member_catches" {
  name     = "member-catches"
  position = 2
  nsfw     = false

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_text_channel" "community_off_topic" {
  name     = "off-topic"
  position = 3
  nsfw     = false

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_stage_channel" "community_stage" {
  count    = 1
  name     = "Stage ${count.index + 1}"
  position = 4 + count.index

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
}

resource "discord_voice_channel" "community_lounge" {
  count    = 3
  name     = "Lounge ${count.index + 1}"
  position = (max([for c in discord_stage_channel.community_stage : c.position]...) + 1) + count.index

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community, discord_stage_channel.community_stage]
}

resource "discord_voice_channel" "community_afk" {
  name = "Go Away I'm Baitin'!"
  position = length(discord_voice_channel.community_lounge) + max([
    for c in discord_voice_channel.community_lounge : c.position
  ]...)

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community, discord_voice_channel.community_lounge]
}


########################################################################################################################
# Permissions
########################################################################################################################
