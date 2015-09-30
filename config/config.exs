# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for third-
# party users, it should be done in your mix.exs file.

config :logger, :console,
  level: :warn,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:user_id]

config :echo, Echo,
  preferences: Echo.Preferences.Test,
  adapters: [Echo.Adapters.Logger, Echo.Adapters.Email],
  hooks: %{
    email: Echo.Test.EmailHook
  }
