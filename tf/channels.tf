########################################################################################################################
# System Channel
########################################################################################################################
resource "discord_system_channel" "production_system" {
  server_id         = discord_server.production.id
  system_channel_id = discord_text_channel.information_welcome.id
  depends_on        = [discord_server.production, discord_text_channel.information_welcome]
}

########################################################################################################################
# Information Section
########################################################################################################################
resource "discord_category_channel" "information" {
  name     = "Information"
  position = 0

  server_id  = discord_server.production.id
  depends_on = [discord_server.production]
}

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
# Angling Section
########################################################################################################################
resource "discord_category_channel" "angling" {
  name     = "Angling 🎣"
  position = 1

  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.information]
}

resource "discord_forum_channel" "angling_rods_n_reels" {
  name     = "rods-n-reels"
  position = 0

  server_id  = discord_server.production.id
  category   = discord_category_channel.angling.id
  depends_on = [discord_server.production, discord_category_channel.angling]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_forum_channel" "angling_terminal_tackle" {
  name     = "terminal-tackle"
  position = 1

  server_id  = discord_server.production.id
  category   = discord_category_channel.angling.id
  depends_on = [discord_server.production, discord_category_channel.angling]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_forum_channel" "angling_technique" {
  name     = "technique"
  position = 2

  server_id  = discord_server.production.id
  category   = discord_category_channel.angling.id
  depends_on = [discord_server.production, discord_category_channel.angling]
  lifecycle { ignore_changes = [topic] }
}


########################################################################################################################
# Community Section
########################################################################################################################
resource "discord_category_channel" "community" {
  name       = "Community 💬"
  position   = 2
  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.angling]
}

resource "discord_text_channel" "community_gear_chat" {
  name       = "gear-chat"
  position   = 0
  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_text_channel" "community_member_catches" {
  name     = "member-catches"
  position = 1
  nsfw     = false

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_text_channel" "community_off_topic" {
  name     = "off-topic"
  position = 2

  server_id  = discord_server.production.id
  category   = discord_category_channel.community.id
  depends_on = [discord_server.production, discord_category_channel.community]
  lifecycle { ignore_changes = [topic] }
}

resource "discord_stage_channel" "community_stage" {
  count    = 1
  name     = "Stage ${count.index + 1}"
  position = 3 + count.index

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
# Live Fishing
########################################################################################################################
resource "discord_category_channel" "live_fishing" {
  name     = "Live Fishin' 📺"
  position = 3

  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.community]
}

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
# Administration
########################################################################################################################
resource "discord_category_channel" "administration" {
  name     = "Administration ⛔"
  position = 6

  server_id  = discord_server.production.id
  depends_on = [discord_server.production, discord_category_channel.live_fishing]
}

resource "discord_text_channel" "administration_branding" {
  name     = "branding"
  position = 1

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_text_channel" "administration_tech" {
  name     = "tech-sperg"
  position = 2

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_text_channel" "administration_void" {
  name     = "factoid-void"
  position = 3

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}

resource "discord_voice_channel" "administration_bants" {
  name     = "Banter"
  position = 4

  server_id  = discord_server.production.id
  category   = discord_category_channel.administration.id
  depends_on = [discord_server.production, discord_category_channel.administration]
}
