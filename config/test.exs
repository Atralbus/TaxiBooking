use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :exam1, Exam1.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :exam1, Exam1.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "exam1_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "chrome_driver"
config :exam1, sql_sandbox: true
config :pbkdf2_elixir, rounds: 1