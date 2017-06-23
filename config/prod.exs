use Mix.Config

config :kitto,
  reload_code?: false,
  watch_assets?: false,
  serve_assets?: true,
  ip: {0, 0, 0, 0},
  port: {:system, "PORT"}

# For distillery releases
config :kitto, root: :otp_app

config :cd_dash,
  forecastio_api_key: {:system, "FORECASTIO_API_KEY"},
  jira_username: {:system, "JIRA_USERNAME"},
  jira_password: {:system, "JIRA_PASSWORD"},
  jira_url: {:system, "JIRA_URL"},
  victorops_api_id: {:system, "VICTOROPS_API_ID"},
  victorops_api_key: {:system, "VICTOROPS_API_KEY"},
  twitter_consumer_key: {:system, "TWITTER_CONSUMER_KEY"},
  twitter_consumer_secret: {:system, "TWITTER_CONSUMER_SECRET"},
  twitter_access_token: {:system, "TWITTER_ACCESS_TOKEN"},
  twitter_access_token_secret: {:system, "TWITTER_ACCESS_TOKEN_SECRET"}
