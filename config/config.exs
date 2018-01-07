# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :exam1,
  ecto_repos: [Exam1.Repo]

# Configures the endpoint
config :exam1, Exam1.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "X9TdFR9j7Fu05OcNf5P0YH6XSrLd37HJoB4GZ8Tr7aUGNHRUlo0BcvxWWCFJ+9og",
  render_errors: [view: Exam1.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Exam1.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  issuer: "Exam1",
  ttl: {30, :days},
  allowed_drift: 2000,
  secret_key: "qtfcsBk6pMo+v4Qti72i3Ap0RakaSmsqttwij9gxnwUHMib7Ue7djdhlxMJgogeu",
  serializer: Exam1.GuardianSerializer
