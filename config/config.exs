# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jabberwocky,
  ecto_repos: [Jabberwocky.Repo]

# Configures the endpoint
config :jabberwocky, JabberwockyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f2H5y4GslhyIlpIIWH1ah/3ysey25WFFfLcNkRGw/guQUAG3/YKVLf5nP9me44zr",
  render_errors: [view: JabberwockyWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Jabberwocky.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure email client
config :jabberwocky, :email_client, Jabberwocky.Email.Mailer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
