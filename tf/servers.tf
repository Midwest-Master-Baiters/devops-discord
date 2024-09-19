resource "discord_server" "production" {
  name = "Midwest Master Baiters"

  afk_channel_id                = "1263209406636494968"
  afk_timeout                   = 3600
  default_message_notifications = 1
  explicit_content_filter       = 2
  #  icon_data_uri                 = ""
  #  owner_id                      = ""
  #  region                        = ""
  #  splash_data_uri               = "https://raw.githubusercontent.com/Midwest-Master-Baiters/devops-discord/master/static/splash.jpg"
  verification_level            = 1
}