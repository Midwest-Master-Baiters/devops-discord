########################################################################################################################
# Everyone
########################################################################################################################
data "discord_permission" "everyone" {
  read_message_history      = "allow"
  view_channel              = "allow"
  add_reactions             = "allow"
  attach_files              = "allow"
  create_public_threads     = "allow"
  embed_links               = "allow"
  send_messages             = "allow"
  send_thread_messages      = "allow"
  send_voice_messages       = "allow"
  use_application_commands  = "allow"
  use_external_apps         = "allow"
  use_external_emojis       = "allow"
  use_external_stickers     = "allow"
  use_external_sounds       = "allow"
  connect                   = "allow"
  speak                     = "allow"
  stream                    = "allow"
  start_embedded_activities = "allow"
  use_soundboard            = "allow"
  use_vad                   = "allow"
}

resource "discord_role_everyone" "everyone" {
  permissions = data.discord_permission.everyone.allow_bits
  server_id   = discord_server.production.id
}


########################################################################################################################
# Master Baiters
########################################################################################################################
data "discord_permission" "administrators" {
  administrator = "allow"
}

data "discord_color" "administrators" {
  hex = "#FFD700"
}

resource "discord_role" "administrators" {
  name  = "Master Baiters"
  color = data.discord_color.administrators.dec

  hoist       = true
  mentionable = false
  position    = 2

  permissions = data.discord_permission.administrators.allow_bits
  server_id   = discord_server.production.id
}


########################################################################################################################
# Hang Danglers
########################################################################################################################
data "discord_permission" "moderators" {
  kick_members         = "allow"
  ban_members          = "allow"
  change_nickname      = "allow"
  create_events        = "allow"
  manage_events        = "allow"
  manage_nicknames     = "allow"
  manage_roles         = "allow"
  moderate_members     = "allow"
  view_audit_log       = "allow"
  manage_messages      = "allow"
  manage_threads       = "allow"
  mention_everyone     = "allow"
  read_message_history = "allow"
  send_polls           = "allow"
  move_members         = "allow"
  mute_members         = "allow"
  deafen_members       = "allow"
}

data "discord_color" "moderators" {
  hex = "#FC0FC0"
}

resource "discord_role" "moderators" {
  name  = "Hang Danglers"
  color = data.discord_color.moderators.dec

  hoist       = true
  mentionable = false
  position    = 1

  permissions = data.discord_permission.moderators.allow_bits
  server_id   = discord_server.production.id
}