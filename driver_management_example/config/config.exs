# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :driver_management_example,
  ecto_repos: [DriverManagementExample.Repo]

# Configures the endpoint
config :driver_management_example, DriverManagementExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WCdpaMLaIUaYlmH3xeLtNkmI8DWtz7LBhBJJNlgINYlAqW/yorg1fZxZKs9PcFh1",
  render_errors: [view: DriverManagementExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DriverManagementExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
