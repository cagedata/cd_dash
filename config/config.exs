# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :kitto,
  root: Path.dirname(__DIR__),
  ip: {0, 0, 0, 0},
  port: 4000,
  otp_app: :cd_dash,
  default_dashboard: "general"

# Use reload_code?: false to disable code reloading in development environment
# Read More: https://github.com/kittoframework/kitto/wiki/Code-Reloading

# Use ip: {:system, "KITTO_IP"} to have binding ip configurable via env variable
# Example: `KITTO_IP=0.0.0.0 mix kitto.server` will start the server on 0.0.0.0

# Use port: {:system, "KITT0_PORT"} to have port port configurable via env variable
# Example: `KITTO_PORT=4444 mix kitto.server` will start the server on port 4444

# Change the binding ip of the asset watcher server
# config :kitto, assets_host: "127.0.0.1"

# Change the binding port of the asset watcher server
# config :kitto, assets_port: 8080

# Use serve_assets?: true to enable serving static assets
# config :kitto, serve_assets?: true
#
# Use default_dashboard: "your-dashboard" to specify the dashboard to be served
# when the root path is requested.

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Add authentication to `PORT /widgets/:id`. Change "asecret" to something more
# secure.
#
# config :kitto, :auth_token: "asecret"

config :cd_dash,
  forecast_location: "41.448170,-72.804079",
  victorops_team: "support-team",
  twitter_search: "#devops"

try do
  import_config "config.secret.exs"
catch _value -> IO.puts "Could not load secret config"
end

# Load environment specific configuration
import_config "#{Mix.env}.exs"
