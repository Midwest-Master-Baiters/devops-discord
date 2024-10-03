resource "discord_category_channel" "angling" {
  name     = "Angling Help and Tutorials 🎣"
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