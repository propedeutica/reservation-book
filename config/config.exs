# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :reservation_book,
  ecto_repos: [ReservationBook.Repo]

# Configures the endpoint
config :reservation_book, ReservationBookWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8l/VmvhfQNEzavdJaMRT8Idgq7WLxRiGuRSCl7SE8c3Afk+/3glXyE5uT2AGsXs+",
  render_errors: [view: ReservationBookWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ReservationBook.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
