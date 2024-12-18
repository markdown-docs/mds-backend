import Config

# Configure SQLite database for testing
config :backend, Backend.Repo,
  adapter: Ecto.Adapters.SQLite3,
  database: "file::memory:?cache=shared",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :backend, BackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "1LHap5C2/Ynbu5dyBAx0d2QJKO78EEq1e6sQU/2XdKeIE8CD/IJhfJMD2yyOtWRP",
  server: false

# In test we don't send emails
config :backend, Backend.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
