########################################################################################################################
# Master Baiters
########################################################################################################################
# data "discord_permission" "master_baiters" {
#   ban_members = true
#   change_nickname = true
#   create_events = ""
#   create_expressions = ""
#   create_instant_invite = ""
#   kick_members = ""
#   manage_channels = ""
#   manage_emojis = ""
#   manage_nicknames = ""
#   manage_roles = ""
#   manage_guild = ""
#   manage_webhooks = ""
#   moderate_members = ""
#   view_channel = ""
#   view_audit_log = ""
#   view_guild_insights = ""
#
#   add_reactions = ""
#   attach_files = ""
#   create_private_threads = ""
#   create_public_threads = ""
#   embed_links = ""
#   manage_messages = ""
#   manage_threads = ""
#   mention_everyone = ""
#   read_message_history = ""
#   send_messages = ""
#   send_thread_messages = ""
#   send_polls = True
#
#
# }

data "discord_color" "master_baiters" {
  hex = "#FC0FC0"
}

resource "discord_role" "master_baiters" {
  name  = "Master Baiters"
  color = data.discord_color.master_baiters.dec

  hoist       = false
  mentionable = false
  position    = 1

  permissions = 1721826619162615
  server_id   = discord_server.production.id
}