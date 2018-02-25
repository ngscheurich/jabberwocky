use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jabberwocky, JabberwockyWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :jabberwocky, Jabberwocky.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "jabberwocky_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure email client
config :jabberwocky, :email_client, Jabberwocky.Email.InMemoryMailer
